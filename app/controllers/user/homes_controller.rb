class User::HomesController < ApplicationController

  def top
    respond_to do |format|
      format.html {}
      format.js do
        response["Content-Type"]="application/javascript"
      end
    end
  end

end
