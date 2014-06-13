if (argument0==true) {
    objeto_bloco=obj_block;
    objeto_gomez=obj_gomez;
} else {
    objeto_bloco=obj_editor_block;
    objeto_gomez=obj_editor_gomez;
    with (objeto_bloco) {
        instance_destroy();
    }
}
arquivo=file_text_open_read(get_open_filename("Fez4ever levels|*.f4e",""));
if (arquivo!=-1) {
    inicial=file_text_read_string(arquivo);
    file_text_readln(arquivo);
    if (inicial=="=====PRINCIPAL") {
        versao=file_text_read_string(arquivo);
        file_text_readln(arquivo);
        if (real(versao)==3) {
            file_text_readln(arquivo);
            create_gomez_x=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_gomez_y=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_gomez_z=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            file_text_readln(arquivo);
            num_blocks=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            repeat(real(num_blocks)) {
                create_block_x=file_text_read_string(arquivo);
                file_text_readln(arquivo);
                create_block_y=file_text_read_string(arquivo);
                file_text_readln(arquivo);
                create_block_z=file_text_read_string(arquivo);
                file_text_readln(arquivo);
                create_block_sprite_index=file_text_read_string(arquivo);
                file_text_readln(arquivo);
                create_block=instance_create(real(create_block_x),real(create_block_y),objeto_bloco);
                create_block.z=real(create_block_z);
                create_block.sprite_index=real(create_block_sprite_index);
            }
            create_gomez=instance_create(real(create_gomez_x),real(create_gomez_y),objeto_gomez);
            create_gomez.z=real(create_gomez_z);
        }
    } else {
        create_gomez_x=inicial
        create_gomez_y=file_text_read_string(arquivo);
        file_text_readln(arquivo);
        create_gomez_z=file_text_read_string(arquivo);
        file_text_readln(arquivo);
        num_blocks=file_text_read_string(arquivo);
        file_text_readln(arquivo);
        repeat(real(num_blocks)) {
            create_block_x=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_block_y=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_block_z=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_block_sprite_index=file_text_read_string(arquivo);
            file_text_readln(arquivo);
            create_block=instance_create(real(create_block_x),real(create_block_y),objeto_bloco);
            create_block.z=real(create_block_z);
            create_block.sprite_index=real(create_block_sprite_index);
        }
        create_gomez=instance_create(real(create_gomez_x),real(create_gomez_y),objeto_gomez);
        create_gomez.z=real(create_gomez_z);
    }
    file_text_close(arquivo);
} else {
    if (argument0==true) {
        game_restart();
    }
}
