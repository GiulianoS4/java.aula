// Classe base Veiculo
abstract class Veiculo {
    String modelo;
    int ano;
    int velocidadeAtual;
    int velocidadeMaxima;
    double consumoPorKm; // Consumo em litros por quilômetro
    double tanqueDeCombustivel;

    // Construtor
    public Veiculo(String modelo, int ano, int velocidadeMaxima, double consumoPorKm, double tanqueDeCombustivel) {
        this.modelo = modelo;
        this.ano = ano;
        this.velocidadeAtual = 0;
        this.velocidadeMaxima = velocidadeMaxima;
        this.consumoPorKm = consumoPorKm;
        this.tanqueDeCombustivel = tanqueDeCombustivel;
    }

    // Método para acelerar o veículo
    public void acelerar() {
        if (velocidadeAtual + 10 <= velocidadeMaxima) {
            velocidadeAtual += 10;
            System.out.println("O veículo está acelerando! Velocidade: " + velocidadeAtual + " km/h");
        } else {
            velocidadeAtual = velocidadeMaxima;
            System.out.println("O veículo atingiu a velocidade máxima de " + velocidadeMaxima + " km/h.");
        }
    }

    // Método para parar o veículo
    public void parar() {
        velocidadeAtual = 0;
        System.out.println("O veículo parou.");
    }

    // Método para calcular a autonomia do veículo (em quilômetros)
    public double calcularAutonomia() {
        return tanqueDeCombustivel / consumoPorKm;
    }

    // Método para mostrar informações gerais do veículo
    public void mostrarInfo() {
        System.out.println("Modelo: " + modelo + ", Ano: " + ano + ", Velocidade Atual: " + velocidadeAtual + " km/h");
        System.out.println("Velocidade Máxima: " + velocidadeMaxima + " km/h, Consumo por Km: " + consumoPorKm + " litros/km");
        System.out.println("Autonomia do veículo: " + calcularAutonomia() + " km");
    }

    // Método para abastecer o veículo
    public void abastecer(double quantidade) {
        tanqueDeCombustivel += quantidade;
        System.out.println("Veículo abastecido com " + quantidade + " litros. Tanque agora tem " + tanqueDeCombustivel + " litros.");
    }

    // Método abstrato para os veículos emitirem um som específico
    public abstract void emitirSom();
}

// Classe derivada Carro
class Carro extends Veiculo {

    // Construtor
    public Carro(String modelo, int ano, double tanqueDeCombustivel) {
        super(modelo, ano, 180, 0.08, tanqueDeCombustivel); // 180 km/h de velocidade máxima, consumo de 0.08 litros/km
    }

    // Sobrescreve o método emitirSom
    @Override
    public void emitirSom() {
        System.out.println("O carro está emitindo o som de um motor!");
    }

    // Método específico do Carro
    public void abrirPorta() {
        System.out.println("A porta do carro foi aberta.");
    }
}

// Classe derivada Caminhao
class Caminhao extends Veiculo {

    // Construtor
    public Caminhao(String modelo, int ano, double tanqueDeCombustivel) {
        super(modelo, ano, 120, 0.15, tanqueDeCombustivel); // 120 km/h de velocidade máxima, consumo de 0.15 litros/km
    }

    // Sobrescreve o método emitirSom
    @Override
    public void emitirSom() {
        System.out.println("O caminhão está emitindo o som de um motor de caminhão!");
    }

    // Método específico do Caminhão
    public void carregarCarga() {
        System.out.println("O caminhão está carregando carga.");
    }
}

public class Main {
    public static void main(String[] args) {
        // Criando objetos das classes derivadas
        Veiculo carro = new Carro("Fusca", 1970, 50); // 50 litros de combustível
        Veiculo caminhao = new Caminhao("Scania", 2020, 200); // 200 litros de combustível

        // Chamando métodos para o objeto carro
        carro.mostrarInfo();
        carro.acelerar();
        carro.acelerar();
        carro.parar();
        carro.abastecer(20); // Abastecendo com 20 litros

        // Chamando métodos para o objeto caminhão
        caminhao.mostrarInfo();
        caminhao.acelerar();
        caminhao.acelerar();
        caminhao.parar();
        caminhao.abastecer(50); // Abastecendo com 50 litros

        // Usando o polimorfismo para chamar o método de objetos específicos
        if (carro instanceof Carro) {
            ((Carro) carro).abrirPorta();
        }
        
        if (caminhao instanceof Caminhao) {
            ((Caminhao) caminhao).carregarCarga();
        }

        // Chamando o som dos veículos
        carro.emitirSom();
        caminhao.emitirSom();
    }
}
