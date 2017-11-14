Content-Type: multipart/mixed; boundary="===============2828953360679564194=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: a30e963539 ("PM: Provide a config snippet for disabling PM"): BUG: kernel reboot-without-warning in test stage
Date: Tue, 14 Nov 2017 19:15:39 +0800
Message-ID: <20171114111539.fqbrgnj24pgg7qdv@wfg-t540p.sh.intel.com>
In-Reply-To: <20171114105218.k74qk2zo4hjygvss@sirena.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2828953360679564194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 10:52:18AM +0000, Mark Brown wrote:
>On Tue, Nov 14, 2017 at 05:19:52PM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://github.com/0day-ci/linux/commits/Mark-Brown/PM-Provide-a-config-=
snippet-for-disabling-PM/20171114-135103
>
>This seems like it's got to be a false positive...

Yes, this kernel reboot/hang issue looks unstable and may change
behavior on different kernel builds. I'll add more bisect checks
for them.

Thanks,
Fengguang


--===============2828953360679564194==--

