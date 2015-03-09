Content-Type: multipart/mixed; boundary="===============9173354847627087479=="
MIME-Version: 1.0
From: Denys Vlasenko <vda.linux@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 13:04:54 +0100
Message-ID: <CAK1hOcNU+8BtCN2TR6ZBh3KTTJtFKdoTe36UfVb91AYxEmeqTg@mail.gmail.com>
In-Reply-To: <20150309114618.GA18686@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9173354847627087479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2015 at 12:46 PM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Andy Lutomirski <luto@amacapital.net> wrote:
>
>> >>      */
>> >>     unsigned long        stack[64];
>> >>
>> >> Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgusting=
. :)
>> >
>> >
>> > Seems to be unused: I commented it out on "defconfig" build
>> > and got no build errors.
>>
>> It's used.  On 32-bit, NMIs don't use task gates (I don't know why),
>
> So task gates were a sexy hardware acceleration feature, eons ago, and
> we used to rely on them a lot,

IIRC task gates weren't used in Linux at first, and now they are
only used for double fault handler - because in many cases
double fault is caused by stack problems, and task gate provides
a way to have alternative stack even for exceptions happening
in CPL0.

--===============9173354847627087479==--

