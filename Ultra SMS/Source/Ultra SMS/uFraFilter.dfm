object fraFilter: TfraFilter
  Left = 0
  Top = 0
  Width = 207
  Height = 505
  AutoScroll = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  ParentBackground = False
  ParentFont = False
  TabOrder = 0
  DesignSize = (
    207
    505)
  object chkEnable: TCheckBox
    Left = 8
    Top = 8
    Width = 105
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = #21551#29992#31579#36873'(&E)'
    TabOrder = 0
    OnClick = SetEnabledStatus
    ExplicitWidth = 99
  end
  object gbTimeFiter: TGroupBox
    Left = 8
    Top = 32
    Width = 193
    Height = 281
    Anchors = [akLeft, akTop, akRight]
    Caption = #25353#26102#38388#31579#36873
    TabOrder = 1
    ExplicitWidth = 187
    DesignSize = (
      193
      281)
    object optTimeOneHour: TRadioButton
      Left = 8
      Top = 40
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #19968#20010#23567#26102#20043#20869'(&H)'
      TabOrder = 1
      OnClick = optTimeOneHourClick
      ExplicitWidth = 171
    end
    object optTimeToday: TRadioButton
      Left = 8
      Top = 64
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #20170#22825'(&T)'
      TabOrder = 2
      OnClick = optTimeTodayClick
      ExplicitWidth = 171
    end
    object optTimeYesterday: TRadioButton
      Left = 8
      Top = 88
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #26152#22825'(&Y)'
      TabOrder = 3
      OnClick = optTimeYesterdayClick
      ExplicitWidth = 171
    end
    object optTimeBeforeYesterday: TRadioButton
      Left = 8
      Top = 112
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #21069#22825'(&B)'
      TabOrder = 4
      OnClick = optTimeBeforeYesterdayClick
      ExplicitWidth = 171
    end
    object optTimeThisWeek: TRadioButton
      Left = 8
      Top = 136
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #26412#21608'(&W)'
      TabOrder = 5
      OnClick = optTimeThisWeekClick
      ExplicitWidth = 171
    end
    object optTimeThisMonth: TRadioButton
      Left = 8
      Top = 160
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #26412#26376'(&M)'
      TabOrder = 6
      OnClick = optTimeThisMonthClick
      ExplicitWidth = 171
    end
    object optTimeThisYear: TRadioButton
      Left = 8
      Top = 184
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #20170#24180'(&A)'
      TabOrder = 7
      OnClick = optTimeThisYearClick
      ExplicitWidth = 171
    end
    object optTimeDisable: TRadioButton
      Left = 8
      Top = 16
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #19981#20351#29992#26102#38388#31579#36873'(&D)'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = SetEnabledStatus
      ExplicitWidth = 171
    end
    object optTimeCutsom: TRadioButton
      Left = 8
      Top = 208
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #33258#23450#20041#26102#38388#31579#36873'(&C)'
      TabOrder = 8
      OnClick = optTimeCutsomClick
      ExplicitWidth = 171
    end
    object chkTimeFrom: TCheckBox
      Left = 24
      Top = 234
      Width = 49
      Height = 17
      Caption = #33258'(&F)'
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = SetEnabledStatus
    end
    object dtpTimeFrom: TDateTimePicker
      Left = 72
      Top = 232
      Width = 113
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Date = 39163.409286377310000000
      Format = 'yyyy'#24180'MM'#26376'dd'#26085
      Time = 39163.409286377310000000
      DateFormat = dfLong
      TabOrder = 10
      OnChange = optTimeCutsomClick
      ExplicitWidth = 107
    end
    object chkTimeTo: TCheckBox
      Left = 24
      Top = 258
      Width = 49
      Height = 17
      Caption = #21040'(&O)'
      Checked = True
      State = cbChecked
      TabOrder = 11
      OnClick = SetEnabledStatus
    end
    object dtpTimeTo: TDateTimePicker
      Left = 72
      Top = 256
      Width = 113
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Date = 39163.409286377310000000
      Format = 'yyyy'#24180'MM'#26376'dd'#26085
      Time = 39163.409286377310000000
      DateFormat = dfLong
      TabOrder = 12
      OnChange = optTimeCutsomClick
      ExplicitWidth = 107
    end
  end
  object gbName: TGroupBox
    Left = 8
    Top = 320
    Width = 193
    Height = 177
    Anchors = [akLeft, akTop, akRight]
    Caption = #25353#22995#21517#31579#36873
    TabOrder = 2
    ExplicitWidth = 187
    DesignSize = (
      193
      177)
    object chkNameEnable: TCheckBox
      Left = 8
      Top = 16
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #21551#29992'(&L)'
      TabOrder = 0
      OnClick = SetEnabledStatus
      ExplicitWidth = 171
    end
    object lstName: TdxImageListBox
      Left = 8
      Top = 91
      Width = 177
      Height = 78
      Alignment = taLeftJustify
      ImageAlign = dxliLeft
      ItemHeight = 0
      ImageList = iltNames
      MultiLines = False
      VertAlignment = tvaCenter
      MultiSelect = True
      Sorted = True
      TabOrder = 4
      OnClick = lstNameClick
      Anchors = [akLeft, akTop, akRight]
      SaveStrings = ()
    end
    object btnNameAdd: TBitBtn
      Left = 8
      Top = 60
      Width = 26
      Height = 26
      TabOrder = 1
      OnClick = btnNameAddClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000001000000000000005A
        0000005C0000006100000065000000690000017A0100007C000001850100018A
        0100028D0200058D0500059005000E940E00149B14002BA72B002EA92E0033B1
        33003AB03A003BB53B003DB13D0044BA44004DBF4D0056BB560058BC58005DBE
        5D0055C455005EC95E0067C2670066CE660068C268006FD36F0078D8780080DD
        800088E2880090E6900099EC9900C8D0D4000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000C080605040000000000000000000000
        0C1513110200000000000000000000000C161513040000000000000000000000
        0817161502000000000000000E0D0C080C1B1A1606020402040000000F222121
        1F1D1B1A161513110500000013232221201F1D1B1A1615130600000017242322
        21201F1D1B1A161508000000181E181C1321201F0C080C0C0C00000000000000
        1E222121080000000000000000000000182322210C0000000000000000000000
        1E2423220D00000000000000000000001818130F0E0000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnNameDel: TBitBtn
      Left = 36
      Top = 60
      Width = 26
      Height = 26
      TabOrder = 2
      OnClick = btnNameDelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000020
        82000022890000238D0000248F000025960000279A0000279C000028A0000029
        A500002AA900002CB1000631B4000935BB000C3AC200123FC6001643C8001D4A
        D0002651D4002B54D0002C56D5002E58D500355DD7003B62D800364EFF003D58
        FF00446ADA005073DC005577DD005678DD004563FF004C6DFF005477FF006080
        DF005B81FF00628CFF006996FF0071A1FF0078ACFF007FB6FF0087C1FF00C8D0
        D400000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000F0D0B0A
        080707070504010400000000132625242322201F1E1918040000000017272625
        242322201F1E1908000000001C28272625242322201F1E0C000000001D211C1A
        161515131211100E000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnNameClear: TBitBtn
      Left = 64
      Top = 60
      Width = 26
      Height = 26
      TabOrder = 3
      OnClick = btnNameClearClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000006464
        6200666666006B6B6B0070706F007D7D7B0000990000109F100029A9290040B3
        400050B9500070C6700091918500A8A89700B8B8A400D0A2A200D6ACAB00DFB3
        B300DDB9B000E4BBBB008FD28F009FD79E00AFDDAB00BFE4B500D1C09E00F9C3
        8900F9C48A00E5C29300FCC79000FDC89200FECA9600F8C89900FFCC9900FAD1
        9C00FFD09E00D0C3A500D1CCB000D3D3B900EBC5AD00EFDEB300F5D5B200FBDF
        BB00FFE0B300FAE4B600FFE7BE00FFE8BF00A7DEF700A3DDFA00E2C4C400E5CA
        C500E2DEC300ECD9CF00E7D0D000EBD8D800EEDDDD00CFE3CA00DCEFD300FFEA
        C100F9EFC400FFECC400FFF4CF00FFF6D200FEF4DA00FFFAD800FFFCDA00FEF8
        DD00FFFFDE00C0FFFF00DFFEFA00DBFFFF00F2E6E600F6ECEC00FFFFE200FFFF
        E600FDF5EB00FFFFE900FFFFEE00E3F2F200E2FFF700E7F8FE00E6FFFF00FFFF
        F300FFFFF500FDF9F900FFFFFE00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000003030302030300000000000000000003252323
        230D040300000000000000033D2C281213262D3203020000000000263A293034
        06171717400E03000000001B1F36343406060606153A03000000001A4A473611
        06060A370922050000003329545410131417091616180C030000274052350F13
        09520B06062A0C030000294B4B3334310E070806063A23030000294049494B4F
        4616150B063E240300002C4049404F4E44545354524B4903000000292C383838
        3838384D2A40400300000000002F4F4444444F2E1A1F3D030000000000002E2F
        2F43432E1C1C22030000000000000000002E2E2E1C1C1C000000}
    end
    object chkNameNoName: TCheckBox
      Left = 8
      Top = 36
      Width = 177
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = #21253#25324#27809#26377#22995#21517#30340#35760#24405'(&R)'
      TabOrder = 5
      ExplicitWidth = 171
    end
  end
  object btnRefresh: TBitBtn
    Left = 128
    Top = 4
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #21047#26032'(&R)'
    TabOrder = 3
    OnClick = btnRefreshClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000000000006048
      300010685000107850006050400020987000A0908000B0A09000C0A89000C0A8
      A000C0B0A000D0B0A000D0B8A000D0B8B000D0C0B000D5C5BD00E0C0B000B0D8
      C000C0C8C000D0C8C000D0D8D000E0C8C000E0D0C000E0D0D000E0D8D000F0D8
      D000C0E0D000F0E0D000D0E0E000DAE0E200DDE2E400D0E8E000D0F0E000F0E0
      E000F0E8E000E0F0F000F0F0F000FFF8F000FFF8FF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000701010101010101010101000000000007270707
      0707070707070100000000000727272724221B17150701000000000007272720
      0224221915070100000000000727270505050512180701000000000008272723
      05251A051907010000000000092727272727250521070100000000000A272705
      2727262422070100000000000B2727051127031C24070100000000000C272720
      050505030D070100000000000D2727272727051406040100000000000E272727
      2727270D13010F00000000001027272727272709010F00000000000010101010
      100D0D0B0F000000000000000000000000000000000000000000}
    ExplicitLeft = 122
  end
  object iltNames: TImageList
    Left = 160
    Top = 352
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000071717100717171007171
      71006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6D00B1654D008C5036008C50
      36008C5036008C5036006C554C006A635F00717171006D6D6D006D6D6D006D6D
      6D006D6D6D0071717100717171006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0664200DC513100F9635000FD72
      5C00F1684E00D7744500F1684E00D24C270035593800355938002F982D004890
      37002F982D0025662500355938006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5885500F9635000FD7C6400FC8B
      6D00D5885500FFCF9C00F36D5300FD6A5700917930004DB34D006AA9660063CA
      630052C252003CB73C00239023006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0664200FD846900EB80
      5900FFCF9C00FFCF9C00EF765600FD6B580080AB670080B38000FFEFDF004DB3
      4D0075D275004FC14F00489037006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1654D004C21
      4F002E3457007F4C6E00B1654D00917930007CD77C008FE08F00FFF7E800BFD9
      AC005BC55B0044A6440000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001717170005070E000D29
      6800143AA000102F9500081D6C00545454006AA96600427399001579BA00247D
      B600377D57004D4D4D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3F001A1A1A00102C5B001A4D
      B3001C56BC001B51B700102F950054545400699AAE002C92F1003399FF003399
      FF002C92F1002C586F0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017171700282828000F2D93002774
      DA002671D7002671D7001E5AC0005A6064003F95C30040A6FF0040A6FF0040A6
      FF003DA2FF002385C6006D6D6D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C2C2C00363636002C586F003191
      F9003399FF003694F700246AD0005A606400479FD0004BB1FF004BB1FF004BB1
      FF004BB1FF002D92E60066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6D004D4D4D003F3F3F004646
      4600143AA0002060C600135F88007E7E7E0057A9D7004DB3F2004DB3F20055BB
      FF0051B7FF0043A8ED006D6D6D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000036363600666666008F8F
      8F00A4A4A4004D4D4D00464646000000000063ABD200247DB60057A9D70063AB
      D200479FD0001372A200699AAE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D6D6D00605E
      5E00605E5E00666666000000000000000000000000003A8BB70084C0E400A3D0
      EA00479FD000699AAE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A8BB7003A8B
      B7003A8BB7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000807F000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      C003000000000000800300000000000000010000000000000001000000000000
      000100000000000000010000000000008101000000000000C383000000000000
      FFC7000000000000FFFF000000000000}
  end
end
