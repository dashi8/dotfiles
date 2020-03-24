
    $latex ='platex -synctex=1 -src-specials -interaction=nonstopmode'; #日本語を使用時．英語でも行けるはず
    #$latex ='latex -synctex=1 -src-specials -interaction=nonstopmode'; # 英語用
    $bibtex = "pbibtex";
    $makeindex = "mendex";
    $dvipdf = "dvipdfmx %O -o %D %S";
    $dvips = "dvipsk";
    #$pdf_mode = 3;#常にdvi経由でpdf作成
    #$pdf_mode = 1;#直接pdf作成

    # プレビュー.appで開く場合
    # $pdf_previewer = "open -ga preview.app";
    # $pdf_update_command = "open -ga preview.app %S";
    # $pdf_update_method = 0;  # auto update

    # Skim.appで開く場合
    $pdf_previewer = "open -a Skim.app";
    $pvc_view_file_via_temporary = 0; # This enables Skim to chase the update in PDF automatically.

    # カレントディレクトリにoutディレクトリを作成し、中間ファイル&pdfを入れる
    $out_dir = "./out";
