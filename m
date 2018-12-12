Content-Type: multipart/mixed; boundary="===============2288669057035603987=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [tty] c96cf923a9: WARNING:possible_circular_locking_dependency_detected
Date: Wed, 12 Dec 2018 14:04:32 +0900
Message-ID: <20181212050432.GE431@jagdpanzerIV>
In-Reply-To: <20181212034252.GD431@jagdpanzerIV>
List-Id: <oe-lkp.lists.linux.dev>

--===============2288669057035603987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/12/18 12:42), Sergey Senozhatsky wrote:
[..]
> > >> [   87.255156]        CPU0                    CPU1
> > >> [   87.255813]        ----                    ----
> > >> [   87.256460]   lock(&port_lock_key);
> > >> [   87.256973]                                lock(console_owner);
> > >> [   87.257829]                                lock(&port_lock_key);
> > >> [   87.258680]   lock(&obj_hash[i].lock);
> =

> So it's like
> =

> 	CPU0					CPU1
> =

> 	uart_shutdown()				db->lock
> 	 uart_port->lock			 debug_print_object()
> 	  free_page()				  printk
> 	   debug_check_no_obj_freed		   uart_port->lock
> 	    db->lock
> =

> =

> In this particular case we probably can just move free_page()
> out of uart_port lock scope. Note that free_page()->MM can printk()
> on its own.
> =

[..]
> =

> [1] https://lore.kernel.org/lkml/1542653726-5655-8-git-send-email-longman=
(a)redhat.com/T/#u

That said, I'd first try Waiman's patch. The one I suggested is
more of a defense move - there are too many things happening under
uart_port->lock. This is not the first time we see lockdep complaining
about the way uart and the rest of the kernel interact.

	-ss

--===============2288669057035603987==--

