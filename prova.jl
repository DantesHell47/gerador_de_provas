using Plots

function gerador_question(N)
    for i in 1:N
        t_inicial = rand(1:100)
        t_final = rand(1:100)
        if t_final > t_inicial
            println("1) Calcule os valores das cargas elétricas nos intervalos")
            println("a) De t=0 a t=$t_final")
            println("b) De t=$t_final a t= $(t_final+10)")
            println("-"^55)
        else
            t_final, t_inicial = t_inicial, t_final
            println("1) Calcule os valores das cargas elétricas nos intervalos")
            println("a) De t=0 a t=$t_final")
            println("b) De t=$t_final a t= $(t_final+10)")
            println("-"^55)
        end
    end
end

gerador_question(10)


# GRAFICOS PARA AS QUESTÕES DA PROVA SOBRE CORRENTE ELÉTRICA
function corrente_vs_tempo()
    incremento = 100
    valor_max_corrente = rand(150:300)
    valor_min_corrente = rand(50:100)
    sort = rand([1,2])
    if sort == 2
        corrente = [fill(valor_max_corrente,2)' fill(valor_min_corrente,2)' fill(valor_max_corrente+incremento, 2)']
    else
        corrente = [ fill(valor_max_corrente+incremento, 2)' fill(valor_min_corrente,2)' fill(valor_max_corrente,2)']
    end    
    return corrente, valor_max_corrente, valor_min_corrente
end


#tempo = [0, 10, 15, 20, 25,35]

# GRÁFICO PARA QUESTÂO 1)
function gerar_gra(N)
    for i in 1:N
        tempo = sort(rand(0:5:100,6))
        valores_corren, valor_max_corrente, valor_min_corrente = corrente_vs_tempo() 
        plot(tempo, valores_corren',
        lw=3.,
        ylims=[0,450],
        yticks=[valor_min_corrente,valor_max_corrente ,valor_max_corrente+100, ],
        legend=false,
        color=:black,
        xlabel="t (s)",
        ylabel="I (A)",
        xticks=tempo,
        grid=:dash,
        alpha=1.
        title="Graf$i"

    )
        # GABARITO
        # a) De t = 0 a t = 10 
        A_r1 = 10 * valor_max_corrente
        # b) De t = 10 a t = 15
        A_t1 = 1/2 * (valor_max_corrente + valor_min_corrente) * 5
        # c) De t = 15 a t = 20
        A_r2 = 5 * valor_min_corrente
        # d) De t = 20 a t = 254
        A_t2 = 1/2 * (valor_max_corrente+ 100 + valor_min_corrente) * 5
        # e) De t = 25 a t = 35
        A_r3 = 10 * (valor_max_corrente+100)

        gab = open("gabarito.txt", "a")
        write(gab, "GABARITO GRAF$i \n a) Ar1 = $A_r1 \n b) At1 = $A_t1 \n c) Ar2 = $A_r2 \n d) At2 = $A_t2 \n e) Ar3 = $A_r3 \n")
        close(gab)

        savefig("/home/dante/Desktop/PROVA-3A3B3C/graf$i.svg")
    end
end


gerar_gra(1000)