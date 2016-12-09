Content-Type: multipart/mixed; boundary="===============0151306865286126440=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Fri, 09 Dec 2016 10:36:44 +0800
Message-ID: <87d1h13k1v.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161208110828.GL3107@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0151306865286126440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Dec 08, 2016 at 04:39:10PM +0800, Huang, Ying wrote:
>
>> >> in testcase: aim7
>> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G
>
> One more question, what does the host system look like? Does that have 4
> CPUs as well?

Yes.  The host system have 4 CPUs.

Best Regards,
Huang, Ying

> I would expect this patch to not matter at all without vcpu overcommit.
>
>
>> Here is the test result for the commit,
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/kconfig/load/rootfs/tbox_group/test/testcase:
>>   gcc-6/x86_64-rhel-7.2/2000/debian-x86_64-2016-08-31.cgz/vm-lkp-a05/lin=
k_test/aim7
>> =

>> commit: =

>>   05ffc951392df57edecc2519327b169210c3df75
>>   3cded41794818d788aa1dc028ede4a1c1222d937
>> =

>> 05ffc951392df57e 3cded41794818d788aa1dc028e =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>       9169   2%     -27.9%       6610   1%  aim7.jobs-per-min
>
> OK, so that's similarly buggered.

--===============0151306865286126440==--

