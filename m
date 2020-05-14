Content-Type: multipart/mixed; boundary="===============4814047634411977855=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: fd21dfbb51: BUG:kernel_NULL_pointer_dereference,address
Date: Thu, 14 May 2020 11:01:31 +0800
Message-ID: <ca2f523f-875f-f326-b116-d2ac461e65da@intel.com>
In-Reply-To: <20200513094818.37oghju6sxs6xwmo@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============4814047634411977855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/13/20 5:48 PM, Christian Brauner wrote:
> On Wed, May 13, 2020 at 04:50:09PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: fd21dfbb51796e455d734a4b0ba412cfe48b678f ("nsproxy: attach to na=
mespaces via pidfds")
>> https://git.kernel.org/cgit/linux/kernel/git/brauner/linux.git setns_pid=
fd
> Well you just saved my ass! :)
>
> I've pushed a tiny fix for that obvious braino to
>
> https://git.kernel.org/cgit/linux/kernel/git/brauner/linux.git setns_pidfd
>
> just now.
> Can you rerun this test on there, please?

I tested the head commit 2b40c5db73e239531ea54991087f4edc07fbb08e, the =

problem has been fixed.

Best Regards,
Rong Chen
--===============4814047634411977855==--

