// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    internal enum Profile {
      internal enum Title {
        /// Profile
        internal static let title = L10n.tr("Localizable", "Profile.Title.tile", fallback: "Perfil")
      }
    }
    
    internal enum Maps {
      internal enum Title {
        /// Maps
        internal static let title = L10n.tr("Localizable", "Maps.Title.tile", fallback: "Maps")
      }
    }
    
  internal enum CreateAccount {
    internal enum Ask {
      /// Já possui conta?
      internal static let title = L10n.tr("Localizable", "CreateAccount.Ask.title", fallback: "Já possui conta?")
    }
    internal enum Button {
      /// Criar
      internal static let title = L10n.tr("Localizable", "CreateAccount.Button.title", fallback: "Criar")
    }
    internal enum Label {
      /// Crie sua Conta
      internal static let title = L10n.tr("Localizable", "CreateAccount.Label.title", fallback: "Crie sua Conta")
    }
  }
  internal enum Login {
    internal enum Button {
      /// Entrar
      internal static let title = L10n.tr("Localizable", "Login.Button.title", fallback: "Entrar")
    }
    internal enum Label {
      /// Ainda não possui conta?
      internal static let title = L10n.tr("Localizable", "Login.Label.title", fallback: "Ainda não possui conta?")
    }
      internal enum NameTextField {
        /// Insira seu Name
        internal static let placeHolder = L10n.tr("Localizable", "Login.NameTextField.placeHolder", fallback: "Insira seu nome")
        /// Name
        internal static let title = L10n.tr("Localizable", "Login.NameTextField.title", fallback: "nome")
      }
    internal enum TextField {
      /// Insira seu e-mail
      internal static let placeHolder = L10n.tr("Localizable", "Login.TextField.placeHolder", fallback: "Insira seu e-mail")
      /// E-mail
      internal static let title = L10n.tr("Localizable", "Login.TextField.title", fallback: "E-mail")
    }
    internal enum TextFieldPassword {
      /// Digite sua senha
      internal static let placeholder = L10n.tr("Localizable", "Login.TextFieldPassword.placeholder", fallback: "Digite sua senha")
      /// Password
      internal static let title = L10n.tr("Localizable", "Login.TextFieldPassword.title", fallback: "Password")
    }
  }
  internal enum Modal {
    internal enum NotficationFailCreate {
      /// Não foi possível criar sua conta, tente mais tarde
      internal static let subTitle = L10n.tr("Localizable", "Modal.NotficationFailCreate.subTitle", fallback: "Não foi possível criar sua conta, tente mais tarde")
      /// Error ao criar conta
      internal static let title = L10n.tr("Localizable", "Modal.NotficationFailCreate.title", fallback: "Error ao criar conta")
    }
    internal enum NotficationFailLogin {
      /// Não foi possível realizar o login, revise os dados e tente novamente, mais tarde
      internal static let subTitle = L10n.tr("Localizable", "Modal.NotficationFailLogin.subTitle", fallback: "Não foi possível realizar o login, revise os dados e tente novamente, mais tarde")
      /// Falha no Login
      internal static let title = L10n.tr("Localizable", "Modal.NotficationFailLogin.title", fallback: "Falha no Login")
    }
    internal enum NotficationSuccessCreate {
      /// Preencha os campos com login e senha
      internal static let subTitle = L10n.tr("Localizable", "Modal.NotficationSuccessCreate.subTitle", fallback: "Preencha os campos com login e senha")
      /// Conta criada com sucesso
      internal static let title = L10n.tr("Localizable", "Modal.NotficationSuccessCreate.title", fallback: "Conta criada com sucesso")
    }
  }
  internal enum Password {
    internal enum TextField {
      /// Insira sua senha
      internal static let placeHolder = L10n.tr("Localizable", "Password.TextField.placeHolder", fallback: "Insira sua senha")
      /// Senha
      internal static let title = L10n.tr("Localizable", "Password.TextField.title", fallback: "Senha")
    }
  }
  internal enum Splash {
    /// Localizable.strings
    ///
    ///
    ///   Created by Jessica Serqueira  on 18/01/23.
    internal static let title = L10n.tr("Localizable", "Splash.title", fallback: "Hello World")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
