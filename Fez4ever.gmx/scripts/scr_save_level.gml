arquivo=file_text_open_write(get_save_filename("Fez4ever levels|*.f4e",""));
if (arquivo!=-1) {
    file_text_write_string(arquivo,"=====PRINCIPAL");
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,string(3));
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,"=====GOMEZ");
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,string(obj_editor_gomez.x));
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,string(obj_editor_gomez.y));
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,string(obj_editor_gomez.z));
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,"=====BLOCOS");
    file_text_writeln(arquivo);
    file_text_write_string(arquivo,string(instance_number(obj_editor_block)));
    file_text_writeln(arquivo);
    with (obj_editor_block) {
        file_text_write_string(other.arquivo,string(x));
        file_text_writeln(other.arquivo);
        file_text_write_string(other.arquivo,string(y));
        file_text_writeln(other.arquivo);
        file_text_write_string(other.arquivo,string(z));
        file_text_writeln(other.arquivo);
        file_text_write_string(other.arquivo,string(sprite_index));
        file_text_writeln(other.arquivo);
    }
    file_text_close(arquivo);
}
