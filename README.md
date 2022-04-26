# AppLouco
App para ajudar com alguns conhecimentos:

##### RegisterView.swift
    - Foi implementado o 
        extension RegisterView: UITextFieldDelegate, que controla o campo de senha ficando uma borda vermelha enquanto a senha nao estiver dentro dos padroes desejados:
                - A senha deve conter no mínimo 6 digitos sendo eles:
                    - no mínimo um caracter especial, 
                    - uma letra maiuscula 
                    - uma letra minuscula 
                    - um numero
                - Esta mensagem de erro esta implementada na clase RegisterViewController.swift
                
        
##### RegExp.swift 
    Foi criado uma rotina para testar se a senha(Passsword) esta tão complexa quanto desejado.
        - Na classe RegisterView.swift, tem o metodo nextButtonTap e nele esta sendo feito o teste da senha.
        

##### RegisterPersonalDataView.swift
    - Nesta classe foi implementado um ToolbarPickerView
        - Na classe ToolbarPickerView.swift inclui dois botões no topo do teclado Selecionar e Cancelar através do UIToolbar, esta classe herda de UIPickerView sendo assim será um PickerView com dois botões.

##### RegisterPersonalDataViewExtensions.swift
    - Foi implementado o DataSource e Delegate do PickerView
        
    
        
