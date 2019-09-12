object MainWindowForm: TMainWindowForm
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = '14 - GUI'
  ClientHeight = 301
  ClientWidth = 224
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object FLabelDescription: TLabel
    Left = 0
    Top = 0
    Width = 224
    Height = 20
    Align = alTop
    Caption = 'Chessboard Description'
    Constraints.MinHeight = 20
    ExplicitWidth = 113
  end
  object FPanelChessAndInput: TPanel
    Left = 0
    Top = 20
    Width = 224
    Height = 281
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Ctl3D = True
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    object FLableChessBoard: TLabel
      Left = 0
      Top = 21
      Width = 224
      Height = 260
      Align = alClient
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 6
      ExplicitHeight = 13
    end
    object FPanelInput: TPanel
      Left = 0
      Top = 0
      Width = 224
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object FButtonShow: TButton
        Left = 149
        Top = 0
        Width = 75
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Show'
        TabOrder = 0
        OnClick = FButtonShowClick
      end
      object FEditChessBoardInput: TEdit
        Left = 0
        Top = 0
        Width = 149
        Height = 21
        Align = alClient
        TabOrder = 1
      end
    end
  end
end
