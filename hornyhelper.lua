---@diagnostic disable: undefined-global, need-check-nil, lowercase-global, cast-local-type, unused-local

script_name("Horny Helper")
script_description('Cross-platform script helper for Families')
script_author("<D3VEL/>")
script_version("1.0 Alpha")
local ffi = require('ffi')
local sampev = require('samp.events')

local default_settings = {
    commands = {
        { cmd = 'finv' , description = 'Пригласить Игорька в семью',  text = '/me передаёт человеку напротив приглашение&/faminvite {id}' , arg = 'id' , enable = true, waiting = '1.200', deleted = false}
    }
}

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(0) end
    welcome_message()
    finv()
    fout()
    fuo()
    fmut()
    frek()
    fumut()
    fw()
    fuw()
    frc()
end

function welcome_message()
	if not sampIsLocalPlayerSpawned() then 
		sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Инициализация хелпера прошла успешно!', 0xFFff00ff)
		sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Для полной загрузки хелпера сначало заспавнитесь (войдите на сервер)',0xFFff00ff)
		repeat wait(0) until sampIsLocalPlayerSpawned()
	end
	sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Загрузка хелпера прошла успешно!', 0xFFff00ff)
end

function finv()
    sampRegisterChatCommand("fi", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg and tonumber(arg) then
                sampSendChat("/faminvite " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fout()
    sampRegisterChatCommand("fu", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg and tonumber(arg) then
                sampSendChat("/famuninvite " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fuo()
    sampRegisterChatCommand("fuo", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg and tonumber(arg) then
                sampSendChat("/famoffkick " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fmut()
    sampRegisterChatCommand("fmt", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg then
                sampSendChat("/fammute " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fumut()
    sampRegisterChatCommand("fumt", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg and tonumber(arg) then
                sampSendChat("/famunmute " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fw()
    sampRegisterChatCommand("fw", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg then
                sampSendChat("/famwarn " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function fuw()
    sampRegisterChatCommand("fuw", function(arg)
        if not isActiveCommand then
            -- Проверяем, если передан аргумент (ID пользователя)
            if arg and tonumber(arg) then
                sampSendChat("/famunwarn " .. arg)
            else
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Вы не указали ID пользователя! Пожалуйста, укажите ID.',0xFFff00ff)
            end
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!',0xFFff00ff)
        end
    end)
end

function frek()
    sampRegisterChatCommand("frek", function()
        if not isActiveCommand then
            lua_thread.create(function()
                isActiveCommand = true

                -- Список всех сообщений, которые нужно отправить
                local messages = {
                    "/fam Привет, в нашей семье есть возможность покупки рангов",
                    "/fam [2]Огузок - 1.OOO.OOO$",
                    "/fam [3]Скромник - 1.5OO.OOO$",
                    "/fam [4]Пупсик - 2.OOO.OOO$",
                    "/fam [5]Водитель велосипеда - 3.5OO.OOO$",
                    "/fam [6]Кайфуша - 4.OOO.OOO$",
                    "/fam [7]Спортик - 5.5OO.OOO$",
                    "/fam [8]Оператор качалки - 6.0OO.OOO$",
                    "/fam [9]Блатной - Установка Фамилии Horny",
                    "/fam Опплатить ранг можно в разделе /fammenu -> Семейная квартира",
                    "/fam [5] Положить деньги на склад семьи",
                    "/fam Не забудь сделать скриншот с time (/time + F8)",
                    "/fam отправлять в ТГ: @IamD3VEL",
                    "/fam Замки не выдаём!!!",
                    "/fam Наш дискорд: https://discord.gg/cTRWq99XQ9"
                }

                -- Отправляем все сообщения с паузами
                for _, message in ipairs(messages) do
                    sampSendChat(message)
                    wait(1000) -- Пауза между сообщениями
                end

                -- Завершаем команду после отправки всех сообщений
                isActiveCommand = false
            end)
        end
    end)
end


function frc()
    sampRegisterChatCommand("frc", function()
        if not isActiveCommand then
            lua_thread.create(function()
                isActiveCommand = true
                sampSendChat("/fam Сейчас произойдёт спавн")
                wait(1000)
                sampSendChat("/fam Всех незанятых семейных автомобилей")
                wait(1000)
                sampSendChat("/fam У вас 15 секунд чтобы занять транспорт...")
                wait(15000)
                sampSendChat("/famspawn")
                isActiveCommand = false
                sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Команда завершена!', 0xFFff00ff)
            end)
        else
            sampAddChatMessage('{ff00ff}[Horny Helper {ff0000}by D3VEL{ff00ff}]: {ffffff}Дождитесь завершения отыгровки предыдущей команды!', 0xFFff00ff)
        end
    end)
end

