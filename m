Content-Type: multipart/mixed; boundary="===============1181069347411331386=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Fri, 14 Sep 2018 16:58:50 +0800
Message-ID: <4811c1a1-c8a0-ad73-7f49-6be2cb269c01@intel.com>
In-Reply-To: <23069.1536838121@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1181069347411331386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/13/2018 07:28 PM, David Howells wrote:
> kernel test robot <rong.a.chen@intel.com> wrote:
>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> Tried that.  That seems to work for me.  Or, at least, it comes to a prom=
pt at
> which I can log in.  I'm not sure whether anything else is meant to happe=
n.
It's a 0day problem, we will fix it as soon as possible.

Best Regards,
Rong Chen

--===============1181069347411331386==--

