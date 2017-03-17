Content-Type: multipart/mixed; boundary="===============3003413471794150275=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 13:18:23 -0700
Message-ID: <CALCETrU328Y-N7BEOCp_5KVzW0beGoEUBk+2PzLpFXYjvaKV4Q@mail.gmail.com>
In-Reply-To: <CA+55aFxrbQpisKU1ZuymdpYgSdxSUZ98k-fXjHZy9G9DwCXtgA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3003413471794150275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 12:36 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Mar 17, 2017 at 11:20 AM, Andy Lutomirski <luto@kernel.org> wro=
te:
>>
>> I can easily imagine that breaking WINE or DOSEMU because it'll affect
>> the LDT, too.
>
> Can they even *read* the LDT contents, though? The whole accessed bit
> doesn't show up in 'struct user_desc', so you can neither set it nor
> read it.

LAR.  I've learned to never underestimate the absurdity of the games
played by 16-bit apps.  (See, for example, the fact that some of them
apparently use SGDT just to find a page that's guaranteed not to be
accessible.)

>
>> How about this:
>
> I don't think that's _wrong_, but..
>
> I'd really rather just do it in fill_ldt() itself, unless you can
> explain how it would be visible to anybody..

See above :(

(Also, your approach would probably break some selftests.)

--Andy

--===============3003413471794150275==--

