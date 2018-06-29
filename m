Content-Type: multipart/mixed; boundary="===============2754775735115794837=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 17:13:26 -0700
Message-ID: <CA+55aFxeZATKBRBsws=94BP8ZxsCv9HE9MBmwe-reuTVZFq=WQ@mail.gmail.com>
In-Reply-To: <20180628233720.GN30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2754775735115794837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 4:37 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> You underestimate the nastiness of that thing (and for the record, I'm
> a lot *less* fond of AIO than you are, what with having had to read that
> nest of horrors lately).  It does not "copy the data to userland"; what it
> does instead is copying into an array of pages it keeps, right from
> IO completion callback.  I

Ugh.

Oh well. I'd be perfectly happy to have somebody re-write and
re-architect the aio code entirely.  Much rather than that the
->poll() code. Because I know which one I think is well-desiged with a
nice usable interface, and which one is a pile of shit.

In the meantime, if AIO wants to do poll() in some irq callback, may I
suggest just using workqueues.

            Linus

--===============2754775735115794837==--

