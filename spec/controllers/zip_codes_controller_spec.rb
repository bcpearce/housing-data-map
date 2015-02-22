require 'rails_helper'

RSpec.describe ZipCodesController, :type => :controller do

  describe "GET #index" do
    it "populates an array of ZipCodes" do
      zip_code = create(:zip_code)
      get :index
      expect(assigns :zip_codes).to eq([zip_code])
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested ZipCode to @zip_code" do
      zip_code = create(:zip_code)
      get :show, id:zip_code
      expect(assigns :zip_code).to eq(zip_code)
    end
    it "renders the :show view" do
      get :show, id:create(:zip_code)
      expect(response).to render_template(:show)
    end
  end

end
