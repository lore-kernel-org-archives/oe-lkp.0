Content-Type: multipart/mixed; boundary="===============6600573659689633712=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mctp] 831119f887: net/mctp/route.c:#RCU-list_traversed_in_non-reader_section
Date: Wed, 15 Sep 2021 09:24:22 +0800
Message-ID: <4876dbfa-6af2-b046-ae5d-a7e2a5c7a69d@intel.com>
In-Reply-To: <eaa3a6409b8b7aa4c00e57f2e8c458ec1cb62af5.camel@codeconstruct.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============6600573659689633712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

On 9/14/2021 5:03 PM, Jeremy Kerr wrote:
> Hi Yujie,
> =

> Thanks for the response! Some notes inline:
> =

>> Sorry, this is because latest trinity package is not uploaded to
>> website yet.
>>
>> Please kindly edit the job-script and change trinity package to
>> 20210905 at 'export bm_initrd=3D...' line.
> =

> Yep, I did that; that's were I was seeing the error from the VM's init
> scripts:
> =

>    [  239.132159] rc.local[723]: /etc/init.d/lkp-bootstrap: 75: /etc/init=
.d/lkp-bootstrap: /lkp/root/src/bin/lkp-setup-rootfs: not found
> =

>> git clone https://github.com/intel/lkp-tests.git
>> cd lkp-tests
>> # job-script is attached in this mail, and we have modified the
>> trinity package date.
>> sudo ./bin/lkp qemu -o result -k <path/to/bzImage> job-script
> =

> Oh, this needs to run as root? That doesn't seem to be documented?
> =

> Even after re-running with sudo (and the modified job-script), I saw the
> same error - looks like I needed to remove ~/.lkp/cache/ to get it to
> work; might be an issue with stale results from the earlier failed
> downloads?

Thanks for the response. we'll update our report to add some tips such as
run as root and rm .lkp dir to run from a clean state.

Hope this would make it smoother for developers to use our tool.

Regards,

Yujie

> =

> That's getting trinity running now, but I see a bunch of different
> locking issues (partial dmesg attached), within the x86 arch code,
> rather than the MCTP mutex issue. Might be something to do with
> running on an AMD system here, I suspect...
> =

> Thanks for the pointers, I'll keep debugging here.
> =

> Cheers,
> =

> =

> Jeremy
>
--===============6600573659689633712==--

