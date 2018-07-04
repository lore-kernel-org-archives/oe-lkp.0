Content-Type: multipart/mixed; boundary="===============2156404450367138026=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] a067b3644b: vm-scalability.throughput -73.2% regression
Date: Wed, 04 Jul 2018 14:25:32 +0800
Message-ID: <20180704062532.GC10005@yexl-desktop>
In-Reply-To: <20180620202741.GB11479@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2156404450367138026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Matthew

The issue should be fixed now, could you have a try?

Thanks,
Xiaolong

On 06/20, Matthew Wilcox wrote:
>On Wed, Jun 20, 2018 at 03:34:06PM +0800, kernel test robot wrote:
>> To reproduce:
>> =

>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>
>$ /usr/bin/wget --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000 --tries 1000 https://download.01.org/0day-ci/lkp-qemu/osimage/pkg/commo=
n/vm-scalability-x86_64.cgz -N -P /home/willy/.lkp/cache/osimage/pkg/common
>--2018-06-20 16:24:50--  https://download.01.org/0day-ci/lkp-qemu/osimage/=
pkg/common/vm-scalability-x86_64.cgz
>Resolving download.01.org (download.01.org)... 184.26.212.127, 2600:140b:2=
000:286::ae6, 2600:140b:2000:2bf::ae6
>Connecting to download.01.org (download.01.org)|184.26.212.127|:443... con=
nected.
>HTTP request sent, awaiting response... 404 Not Found
>2018-06-20 16:24:50 ERROR 404: Not Found.
>
>:-(

--===============2156404450367138026==--

