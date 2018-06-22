Content-Type: multipart/mixed; boundary="===============9186777519051712159=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 19:05:14 +0900
Message-ID: <CA+55aFxfdnFUkDQX6LCFXz=Q9_KbSy3bjqb6zCj9VKj6fA42VA@mail.gmail.com>
In-Reply-To: <CA+55aFyW-zN4363TOwptyzZ=6S1fDeatZMe6hYa656AJmnhmXA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9186777519051712159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 7:02 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Get your act together. Don't uglify and slow down everything else just
> because you're concentrating only on aio.

.. and seriously, poll and select are timing-critical. There are many
real loads where they show up as *the* thing in kernel profiles.

aio is a distant distant second cousin. You need to make sure poll and
select are prioritized, and aio should be a "if we can do this
cleanly" case.

                Linus

--===============9186777519051712159==--

