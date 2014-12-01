# enconding: utf-8

class ProdutosController < ApplicationController
	def index
		@produtos = Produto.all
	end

	def show
    @produtos = Produto.find(params[:id])  
  end

	def new
    @produtos = Produto.new
	end

	def create 
		@produtos = Produto.new(produtos_params)

		if @produtos.save
			flash[:success] = "Produto salvo com sucesso"
			redirect_to produtos_path
		else
	    flash[:error] = "Não foi possível salvar esse produto"
	    render :new
		end
	end

	def edit
		@produtos = Produto.find(params[:id])
	end

	def update
    @produtos = Produto.find(params[:id])

    if @produtos.update_attributes(client_params)
    	flash[:success] = "Produto alterado com sucesso"
			redirect_to produtos_path
		else
      flash[:success] = "Não foi possível alterar esse produto"
      render :edit
		end
	end

	def destroy
		@produtos = Produto.find(params[:id])

		if @produtos.destroy
			flash[:success] = "Produto removido com successo"
		else
      flash[:error] = "Não foi possível remover esse produto"
		end

		redirect_to produtos_path
	end
  
  private 
  def produtos_params
    params.require(:produto).permit(:nome, :descricao, :preco, :validade)
  end

end