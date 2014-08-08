Content-Type: multipart/mixed; boundary="===============0110889214661275984=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sbc_gxx] kernel BUG at include/linux/mtd/map.h:148!
Date: Thu, 07 Aug 2014 22:08:05 -0400
Message-ID: <CAPDOMVhv2nThm3Ka1BFQwn37+b9M_=RdZzQLK=u1rTJ3YdaXFQ@mail.gmail.com>
In-Reply-To: <20140807224618.GQ3711@ld-irv-0074>
List-Id: <oe-lkp.lists.linux.dev>

--===============0110889214661275984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2014 at 6:46 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi,
>
> On Tue, Aug 05, 2014 at 08:08:57PM -0400, Nick Krause wrote:
>> On Tue, Aug 5, 2014 at 9:59 AM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
>> > Hello,
>> >
>> > This is an old BUG that still lives in linux-next.
>> >
>> > [    4.284620] device id =3D 2670
>> > [    4.286157] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
>> > [    4.287060] ------------[ cut here ]------------
>> > [    4.287722] kernel BUG at include/linux/mtd/map.h:148!
>> > [    4.288048] invalid opcode: 0000 [#1] PREEMPT SMP
>>
>> I am new , here and will try to trace your issue on linus's tree
>> unless there is a major difference between Linus's tree and
>> linux-next.
>> If there is please let me known before I start tracing this.
>
> This is a known issue, and Fengguang has reported this before:
>
>   http://lists.infradead.org/pipermail/linux-mtd/2014-March/053019.html
>
> I'm still not quite sure how to solve this one. It seems to be a
> limitation of the kconfig language.
>
> Brian


I am and banned from the lists but trying to get back on, if you want
my help please
let me known. I will read this bug report first but just tell me if
you want some help.
Cheers Nick

--===============0110889214661275984==--

