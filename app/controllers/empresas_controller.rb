# enconding: utf-8

class EmpresasController < ApplicationController  
	def index
		@empresas = Empresa.all
	end

	def show
    @empresa = Empresa.find(params[:id])  
  end

	def new
    @empresa = Empresa.new
	end

	def create 
		@empresa = Empresa.new(empresas_params)

		if @empresa.save
			flash[:success] = "Empresa salva com sucesso"
			redirect_to empresas_path
		else
	    flash[:error] = "Não foi possível salvar essa empresa"
	    render :new
		end
	end

	def edit
		@empresa = Empresa.find(params[:id])
	end

	def update
    @empresa = Empresa.find(params[:id])

    if @empresa.update_attributes(client_params)
    	flash[:success] = "Empresa alterada com sucesso"
			redirect_to empresas_path
		else
      flash[:success] = "Não foi possível alterar essa empresa"
      render :edit
		end
	end

	def destroy
		@empresa = Empresa.find(params[:id])

		if @empresa.destroy
			flash[:success] = "Empresa removida com successo"
		else
      flash[:error] = "Não foi possível remover essa empresa"
		end

		redirect_to empresas_path
	end
  
  private 
  def empresas_params
    params.require(:empresa).permit(:nome, :descricao, :cidade)
  end

end