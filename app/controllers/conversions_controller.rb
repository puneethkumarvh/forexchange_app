require 'uri'
require 'net/http'
require 'json'
class ConversionsController < ApplicationController
  before_action :set_conversion, only: %i[show edit update destroy]

  # GET /conversions or /conversions.json
  def index
    @conversion = Conversion.new
    @conversions = Conversion.all
  end

  # GET /conversions/1 or /conversions/1.json
  def show
    base_amount = params[:base_amount]
    url = URI("https://api.apilayer.com/fixer/convert?to=#{@conversion.target_currency}&from=#{@conversion.base_currency}&amount=#{base_amount}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = '74U44b2PPY4C4bRgFvIIBxfjRcAEm0b8'

    response = https.request(request)

    @output = response.read_body
    puts @output
    puts @result = JSON.parse(@output)['result']
  end

  # GET /conversions/new
  def new
    @conversion = Conversion.new
  end

  # GET /conversions/1/edit
  def edit; end

  # POST /conversions or /conversions.json
  def create
    @conversion = Conversion.find_or_initialize_by(conversion_params.except(:base_amount))

    @conversion.update(conv_count: @conversion.conv_count + 1) if @conversion.id.present?

    respond_to do |format|
      if @conversion.save
        format.html do
          redirect_to conversion_url(id: @conversion.id, base_amount: conversion_params[:base_amount]),
                      notice: 'Conversion was successfully created.'
        end
        format.json { render :show, status: :created, location: @conversion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversions/1 or /conversions/1.json
  def update
    respond_to do |format|
      if @conversion.update(conversion_params)
        format.html { redirect_to conversion_url(@conversion), notice: 'Conversion was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversions/1 or /conversions/1.json
  def destroy
    @conversion.destroy

    respond_to do |format|
      format.html { redirect_to conversions_url, notice: 'Conversion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_conversion
    @conversion = Conversion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def conversion_params
    params.require(:conversion).permit(:base_currency, :target_currency, :base_amount, :conv_count, :conv_date)
  end
end
