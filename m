Content-Type: multipart/mixed; boundary="===============8046469490657769878=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 14:14:33 -0700
Message-ID: <CA+55aFxzdFxUUCSDgt_5cPdL1NxS9GDtHOkPkwOui6PTuqEj+g@mail.gmail.com>
In-Reply-To: <CALCETrXdazkZznTX88EZLVGB-ZFUVEwGMxiGXvN7pPw0WGKoFQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8046469490657769878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 1:54 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
>
> But I might need to that anyway for procfs to read the the stack,
> right?  Do you see another way to handle that case?

I think the other way to handle the kernel stack reading would be to
simply make the stack freeing be RCU-delayed, and use the RCU list
itself as the stack cache.

That way reading the stack is ok in a RCU context, although you might
end up reading a stack that has been re-used.

Would that work for people?

                Linus

--===============8046469490657769878==--

