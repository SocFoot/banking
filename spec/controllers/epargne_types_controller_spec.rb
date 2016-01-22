require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe EpargneTypesController, type: :controller do

  before(:each) do
    @user = User.create!(
        :nom => "foo",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :adresse => "Adresse",
        :email => "oo@gmail.com",
        :password => "Password Digest"      
    )
  end
  
  # This should return the minimal set of attributes required to create a valid
  # EpargneType. As you add validations to EpargneType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {nom:"toto", epargne_id:1}
  }

  let(:invalid_attributes) {
    {epargne_id:1, nom:""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EpargneTypesController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: User.first.id } }

  describe "GET #index" do
    it "assigns all epargne_types as @epargne_types" do
      epargne_type = EpargneType.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:epargne_types)).to eq([epargne_type])
    end
  end

  describe "GET #show" do
    it "assigns the requested epargne_type as @epargne_type" do
      epargne_type = EpargneType.create! valid_attributes
      get :show, {:id => epargne_type.to_param}, valid_session
      expect(assigns(:epargne_type)).to eq(epargne_type)
    end
  end

  describe "GET #new" do
    it "assigns a new epargne_type as @epargne_type" do
      get :new, {}, valid_session
      expect(assigns(:epargne_type)).to be_a_new(EpargneType)
    end
  end

  describe "GET #edit" do
    it "assigns the requested epargne_type as @epargne_type" do
      epargne_type = EpargneType.create! valid_attributes
      get :edit, {:id => epargne_type.to_param}, valid_session
      expect(assigns(:epargne_type)).to eq(epargne_type)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EpargneType" do
        expect {
          post :create, {:epargne_type => valid_attributes}, valid_session
        }.to change(EpargneType, :count).by(1)
      end

      it "assigns a newly created epargne_type as @epargne_type" do
        post :create, {:epargne_type => valid_attributes}, valid_session
        expect(assigns(:epargne_type)).to be_a(EpargneType)
        expect(assigns(:epargne_type)).to be_persisted
      end

      it "redirects to the created epargne_type" do
        post :create, {:epargne_type => valid_attributes}, valid_session
        expect(response).to redirect_to(EpargneType.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved epargne_type as @epargne_type" do
        post :create, {:epargne_type => invalid_attributes}, valid_session
        expect(assigns(:epargne_type)).to be_a_new(EpargneType)
      end

      it "re-renders the 'new' template" do
        post :create, {:epargne_type => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nom:"om"}
      }

      it "updates the requested epargne_type" do
        epargne_type = EpargneType.create! valid_attributes
        put :update, {:id => epargne_type.to_param, :epargne_type => new_attributes}, valid_session
        epargne_type.reload
      end

      it "assigns the requested epargne_type as @epargne_type" do
        epargne_type = EpargneType.create! valid_attributes
        put :update, {:id => epargne_type.to_param, :epargne_type => valid_attributes}, valid_session
        expect(assigns(:epargne_type)).to eq(epargne_type)
      end

      it "redirects to the epargne_type" do
        epargne_type = EpargneType.create! valid_attributes
        put :update, {:id => epargne_type.to_param, :epargne_type => valid_attributes}, valid_session
        expect(response).to redirect_to(epargne_type)
      end
    end

    context "with invalid params" do
      it "assigns the epargne_type as @epargne_type" do
        epargne_type = EpargneType.create! valid_attributes
        put :update, {:id => epargne_type.to_param, :epargne_type => invalid_attributes}, valid_session
        expect(assigns(:epargne_type)).to eq(epargne_type)
      end

      it "re-renders the 'edit' template" do
        epargne_type = EpargneType.create! valid_attributes
        put :update, {:id => epargne_type.to_param, :epargne_type => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested epargne_type" do
      epargne_type = EpargneType.create! valid_attributes
      expect {
        delete :destroy, {:id => epargne_type.to_param}, valid_session
      }.to change(EpargneType, :count).by(-1)
    end

    it "redirects to the epargne_types list" do
      epargne_type = EpargneType.create! valid_attributes
      delete :destroy, {:id => epargne_type.to_param}, valid_session
      expect(response).to redirect_to(epargne_types_url)
    end
  end

end
