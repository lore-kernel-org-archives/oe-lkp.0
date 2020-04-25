Content-Type: multipart/mixed; boundary="===============0096404101544676195=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: ddeb155090 ("kernfs: handle multiple namespace tags"): [ 125.094839] BUG: KASAN: use-after-free in sysfs_kill_sb
Date: Sat, 25 Apr 2020 19:58:03 +0800
Message-ID: <1df5581d-396f-d613-1c31-8a8e338dd305@intel.com>
In-Reply-To: <20200425113014.nwwvmdnqiblibhmk@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============0096404101544676195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/25/2020 7:30 PM, Christian Brauner wrote:
> On Sat, Apr 25, 2020 at 07:17:50PM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git loopfs=
_v1
>>
>> commit ddeb155090598eeea4a577770cb7984e20952682
> Hey thanks for testing this but this is on an old version of this
> patchset:
> commit c5f9b6dbba5567579a6eb646cf39bdc31ed36849
> would be the current hash.
> If you're interested in testing this patchset I'd recommend you add the
> https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git loopfs
> branch. This will always point to the branch that is going to be sent
> out for review and I'm only pushing this to kernel.org if it's in good
> enough shape.
> The other <topic>_v<nr> branches will either point to earlier versions
> and are usually created when on-list review has shown that I need to
> roll a new version. :)
>
> Christian

Hi Christian,

Thanks for your detail explanation, we'll ignore the wip branches in future.

Best Regards,
Rong Chen
--===============0096404101544676195==--

