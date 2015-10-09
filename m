Content-Type: multipart/mixed; boundary="===============2350742515386093411=="
MIME-Version: 1.0
From: Al Stone <al.stone@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 7494b07eba: Kernel panic - not syncing: Watchdog detected hard LOCKUP on cpu 0
Date: Fri, 09 Oct 2015 16:52:38 -0600
Message-ID: <56184536.2020009@linaro.org>
In-Reply-To: <6420944.JWV5li10OE@vostro.rjw.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============2350742515386093411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/09/2015 03:02 PM, Rafael J. Wysocki wrote:
> On Thursday, October 08, 2015 05:05:00 PM Al Stone wrote:
>> On 10/08/2015 04:50 PM, Rafael J. Wysocki wrote:
>>> On Thursday, October 08, 2015 02:32:15 PM Al Stone wrote:
>>>> On 10/08/2015 02:41 PM, Rafael J. Wysocki wrote:
>>>>> On Thursday, October 08, 2015 10:37:55 PM Rafael J. Wysocki wrote:
>>>>>> On Thursday, October 08, 2015 10:36:40 AM Al Stone wrote:
>>>>>>> On 10/08/2015 05:44 AM, Hanjun Guo wrote:
>>>>>>>> On 10/08/2015 11:21 AM, kernel test robot wrote:
>>>>>>>>> FYI, we noticed the below changes on
>>>>>>>>>
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
>>>>>>>>> commit 7494b07ebaae2117629024369365f7be7adc16c3 ("ACPI: add in a
>>>>>>>>> bad_madt_entry() function to eventually replace the macro")
>>>>>>>>>
>>>>>>>>> [    0.000000] ACPI: undefined MADT subtable type for FADT 4.0: 1=
27 (length 12)
[snip....]

>> In the meantime, I'll poke the spec folks on the use of reserved subtabl=
e IDs
>> in the MADT and see what the consensus is there.  It may just be a matte=
r of
>> clarifying the language in the spec.
> =

> One additional question to ask is what checks have been present in the OS=
es
> and what they do if they see a reserved MADT subtable ID.  If they haven'=
t been
> doing anything so far, I'm afraid this particular train may be gone alrea=
dy.

It may be gone.  The silence so far is deafening :).

>> It's also on my plate to really dig into an ACPI test suite and see about
>> building something really robust for that -- this can be added as an exa=
mple.
>> I'll see if I have time to send in a patch for FWTS, too, which is pretty
>> good about capturing such things.
> =

> Sounds good!
> =

> Thanks,
> Rafael
> =


Let me know if I need to send the patch to fix the regression elsewhere; it
dawned on me long after I sent it that this may not be the right place for =
it
to go...

-- =

ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone(a)linaro.org
-----------------------------------

--===============2350742515386093411==--

