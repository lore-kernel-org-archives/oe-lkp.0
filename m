Content-Type: multipart/mixed; boundary="===============1812682844409268739=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ltp] 93531c6743:sctp6_ipsec_vti04.fail
Date: Wed, 22 Aug 2018 08:18:38 +0800
Message-ID: <87759659-111a-9664-d898-f81c10d85615@intel.com>
In-Reply-To: <b45ad7b6-94c8-c87c-3f0a-7fc5991080c8@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1812682844409268739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/21/2018 11:31 PM, David Ahern wrote:
> On 8/21/18 1:46 AM, Rong Chen wrote:
>> To reproduce:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com=
/intel/lkp-tests.git
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImage> jo=
b-script # job-script is attached in
>> this email
> What am I missing?
you could use "make modules_install" and add files to modules.cgz
find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz

then run the command
bin/lkp qemu -k <bzImage> -m modules.cgz job-script

Best Regards
Rong Chen

>
> lkp-tests.git$ bin/lkp qemu -k
> ~/kernel.git/kbuild/lkp/arch/x86/boot/bzImage /tmp/job-script
> kernel module is required, please specify it with '-m'
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============1812682844409268739==--

