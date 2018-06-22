Content-Type: multipart/mixed; boundary="===============3573929055741444213=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] a067b3644b: vm-scalability.throughput -73.2% regression
Date: Fri, 22 Jun 2018 15:35:45 +0800
Message-ID: <20180622073545.GT11011@yexl-desktop>
In-Reply-To: <20180620202741.GB11479@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3573929055741444213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

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

Thanks for the feedback, we are fixing this...

Thanks,
Xiaolong

--===============3573929055741444213==--

