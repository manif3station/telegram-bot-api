package TelegramBot;

use Moo;
use WWW::Telegram::BotAPI;

has chat_id => (
    is       => 'ro',
    required => 1,
);

has bot => (
    is      => 'ro',
    lazy    => 1,
    default => sub {
        return WWW::Telegram::BotAPI->new( token => "$ENV{TELEGRAM_TOKEN}" );
    },
);

sub send_message {
    my ( $self, $message ) = @_;
    $self->bot->sendMessage( chat_id => $self->chat_id, text => $message );
}

1;
