Content-Type: multipart/mixed; boundary="===============3248369179699320805=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Sat, 08 Jun 2019 10:42:41 -0700
Message-ID: <CAHk-=wj1G9nXMzAu=Ldbd4_bbzVtWgNORDKMD4bKTO6dRrMPmQ@mail.gmail.com>
In-Reply-To: <20190608152707.GF28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3248369179699320805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2019 at 8:32 AM Paul E. McKenney <paulmck@linux.ibm.com> w=
rote:
>
> On Fri, Jun 07, 2019 at 09:19:42AM -0700, Linus Torvalds wrote:
> >
> >  - bitfields obviously do need locks. 'char' does not.
> >
> > If there's somebody who really notices the alpha issue in PRACTICE, we
> > can then bother to fix it. But there is approximately one user, and
> > it's not a heavy-duty one.
>
> C11 and later compilers are supposed to use read-modify-write atomic
> operations in this sort of situation anyway because they are not supposed
> to introduce data races.

I don't think that's possible on any common architecture. The
bitfields themselves will need locking, to serialize writes of
different fields against each other.

There are no atomic rmw sequences that have reasonable performance for
the bitfield updates themselves.

The fields *around* the bitfields had better be safe, but that's
something we already depend on, and which falls under the heading of
"we don't accept garbage compilers".

              Linus

--===============3248369179699320805==--

