Content-Type: multipart/mixed; boundary="===============3296969649652889071=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 11:20:51 -0700
Message-ID: <CALCETrUtqOmFjj6ie8vaCuM6SX91BNotA-gwf90bUY9hj_qD1g@mail.gmail.com>
In-Reply-To: <CA+55aFzYxqhLoDcepjt4Z3uLRBNdAg5Ou25Uj9vzZO2RfaVrDQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3296969649652889071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 11:07 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Mar 17, 2017 at 11:00 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Fri, Mar 17, 2017 at 10:49 AM, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> The linear address can be used to look up which entry it is. I assume
>>> the GDT starts at ffffffffff577000, and that this is at offset 0x60
>>> from that. Whatever descriptor that would be..
>>
>> Hmm. That should be gdt index 12, aka GDT_ENTRY_TLS_MIN.
>>
>> I guess user space can set almost anything there. Including setting a
>> segment type that isn't accessed, and that the CPU will change on the
>> first actual access.
>>
>> We do have code to verify the limits and types etc iirc, I guess we
>> can make sure to set the accessed bit too.
>
> Hmm. "fill_ldt()" does this:
>
>         desc->type              =3D (info->read_exec_only ^ 1) << 1;
>         desc->type             |=3D info->contents << 2;
>
> which always leaves bit #0 of ->type clear. That's the A bit.
>
> Does the problem go away if we just add a
>
>         desc->type             |=3D 1;
>
> to the end there?

I can easily imagine that breaking WINE or DOSEMU because it'll affect
the LDT, too.

How about this:

https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=3D=
x86/fixes&id=3Ddf8110544c6e899897e1b2ec3ab53d9e4ee40f65

I'll see why selftests didn't catch this, too.

--===============3296969649652889071==--

