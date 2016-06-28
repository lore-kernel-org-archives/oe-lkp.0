Content-Type: multipart/mixed; boundary="===============0124044892362584071=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 14:18:21 -0700
Message-ID: <CA+55aFw2v=fy-1JN2uYSt1O-ef=Apg9K_VhNZG_Oi2wv2Do5rA@mail.gmail.com>
In-Reply-To: <CA+55aFxzdFxUUCSDgt_5cPdL1NxS9GDtHOkPkwOui6PTuqEj+g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0124044892362584071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 2:14 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think the other way to handle the kernel stack reading would be to
> simply make the stack freeing be RCU-delayed, and use the RCU list
> itself as the stack cache.

That said, if you end up having to have a stack reference count for
other reasons anyway, then I guess that creating a
try_get_task_stack()/put_task_stack() model is fine.

The RCU thing would only work for pure readers that can handle stale
data (which would be the stack trace thing). It wouldn't work for the
kthread to_live_kthread() case.

                       Linus

--===============0124044892362584071==--

