Content-Type: multipart/mixed; boundary="===============5925566680977649423=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Fri, 29 Jun 2018 06:40:49 -0700
Message-ID: <CA+55aFwOtTVTjwLB11_k=7sPTz55TRhaF=Tfn+MhjwGtu5bScA@mail.gmail.com>
In-Reply-To: <20180629132924.GB28510@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5925566680977649423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 6:29 AM Christoph Hellwig <hch@lst.de> wrote:
> No need for poll_table_entry, we just need a wait_queue_head.
> poll_table_entry is an select.c internal (except for two nasty driver) -
> neither epoll nor most in-kernel callers use it.

Well, you need the poll_table for the "poll_wait()", and you would
need to be able to have multiple wait-queues even though you only have
one file you're waiting for.

But yes, it doesn't really need to be the full complex poll_table_entry mod=
el.

              Linus

--===============5925566680977649423==--

