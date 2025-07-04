<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Notifications\ResetPasswordNotification;
use App\Notifications\TicketAsignadoNotification;
use App\Notifications\TicketCerradoNotification;
use App\Notifications\TicketReabiertoNotification;
use App\Notifications\TicketResueltoNotification;
use App\Notifications\TicketSolicitadoNotification;
use Illuminate\Support\Facades\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function resetPassword(Request $request)
    {
        $data = $request->all();
        $user = User::where('email', $request->email)->firstOrFail();
        
        $user->notify(new ResetPasswordNotification($data));
    }

    public function ticketCreado(Request $request)
    {
        $data = $request->all();
        $user = User::where('email', $request->email)->firstOrFail();
        $user->notify(new TicketSolicitadoNotification($data));
    }

    public function ticketAsignado(Request $request)
    {
        $data = $request->all();
        $tecnico = User::where('email', $data['emailTecnico'])->first();
        $solicitante = User::where('email', $data['emailSolicitante'])->first();

        Notification::send(collect([$tecnico, $solicitante]), new TicketAsignadoNotification($data));
    }

    public function ticketResuelto(Request $request)
    {
        $data = $request->all();
        $tecnico = User::where('email', $data['emailTecnico'])->first();
        $solicitante = User::where('email', $data['emailSolicitante'])->first();

        Notification::send(collect([$tecnico, $solicitante]), new TicketResueltoNotification($data));
    }

    public function ticketReabierto(Request $request)
    {
        $data = $request->all();
        $tecnico = User::where('email', $data['emailTecnico'])->first();
        $solicitante = User::where('email', $data['emailSolicitante'])->first();

        Notification::send(collect([$tecnico, $solicitante]), new TicketReabiertoNotification($data));
    }

    public function ticketCerrado(Request $request)
    {
        $data = $request->all();
        $tecnico = User::where('email', $data['emailTecnico'])->first();
        $solicitante = User::where('email', $data['emailSolicitante'])->first();

        Notification::send(collect([$tecnico, $solicitante]), new TicketCerradoNotification($data));
    }

}
