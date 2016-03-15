class PartialController < ApplicationController

  def angular
    render 'account_dir'
  end
  
  def account_dir
    respond_to do |format|
      format.html
    end
  end
end
