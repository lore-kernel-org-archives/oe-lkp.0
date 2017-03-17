Content-Type: multipart/mixed; boundary="===============8178904763482643198=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 14:10:42 -0700
Message-ID: <CA+55aFxhsPLddZPaReCa7pUWZfX3vfTTDcUDfZMz3zQ_+rObfA@mail.gmail.com>
In-Reply-To: <CALCETrU328Y-N7BEOCp_5KVzW0beGoEUBk+2PzLpFXYjvaKV4Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8178904763482643198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 1:18 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
> On Fri, Mar 17, 2017 at 12:36 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Can they even *read* the LDT contents, though? The whole accessed bit
>> doesn't show up in 'struct user_desc', so you can neither set it nor
>> read it.
>
> LAR.  I've learned to never underestimate the absurdity of the games
> played by 16-bit apps.  (See, for example, the fact that some of them
> apparently use SGDT just to find a page that's guaranteed not to be
> accessible.)

Ugh. Right you are, LAR will return those type bits.

Of course, maybe somebody cares about them in the GDT already?  So
it's visible even with your patch, isn't it. We give users four
entries to play with...

                Linus

--===============8178904763482643198==--

