Content-Type: multipart/mixed; boundary="===============8729043973842899668=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 9f4835fb96 ("x86/fpu: Tighten validation of user-supplied .."): Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Tue, 26 Sep 2017 08:19:47 +0800
Message-ID: <20170926001947.7ceoek4wt7fvuchz@wfg-t540p.sh.intel.com>
In-Reply-To: <20170925145509.py4prxskkbpqfjsd@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8729043973842899668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 04:55:09PM +0200, Ingo Molnar wrote:
>
>* Fengguang Wu <wfg@linux.intel.com> wrote:
>
>> On Mon, Sep 25, 2017 at 10:20:13AM +0800, kernel test robot wrote:
>> > Hi Ingo,
>> >
>> > On your request I'm resending the report here, with attached dmesg,
>> > kconfig and reproduce script.
>> >
>> > I'll go on to test your split up commits, too.
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/fpu
>>
>> It looks 6fc19a42 ("x86/fpu: Use validate_xstate_header() to validate
>> the xstate_header in sanitize_restored_xstate()") is the first bad commi=
t.
>
>Thank you! Could you check that the latest tip:master or tip:WIP.x86/fpu
>(9cff7344187e) fixes this crash?

Yes, both of them are free from that crash. :)

Regards,
Fengguang

--===============8729043973842899668==--

