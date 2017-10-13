Content-Type: multipart/mixed; boundary="===============8570174510879201125=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Fri, 13 Oct 2017 13:01:59 -0700
Message-ID: <CALCETrV91zeKc__be4otCp_68HYjwobTEPpTEcu69-1FBQBHww@mail.gmail.com>
In-Reply-To: <CA+55aFyvK+proOBKfc41qSH8hoPU+mBiT0=hLhbt_ZQv4N82iA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8570174510879201125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 12:09 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Oct 13, 2017 at 6:56 AM, Andrey Ryabinin
> <aryabinin@virtuozzo.com> wrote:
>>
>> This could be fixed by s/vmovdqa/vmovdqu change like bellow, but maybe t=
he right fix
>> would be to align the data properly?
>
> I suspect anything that has the SHA extensions should also do
> unaligned loads efficiently. The whole "aligned only" model is broken.
> It's just doing two loads from the state pointer, there's likely no
> point in trying to align it.
>
> So your patch looks fine, but maybe somebody could add the required
> alignment to the sha256 context allocation (which I don't know where
> it is).

IIRC if we try the latter, then we'll risk hitting the #*!&@% gcc bug
that mostly prevents 16-byte alignment from working on GCC before 4.8
or so.  That way lies debugging disasters.

--===============8570174510879201125==--

