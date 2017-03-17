Content-Type: multipart/mixed; boundary="===============4594349493750580072=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] bae58218d8: WARNING:at_mm/page_alloc.c:#drain_all_pages
Date: Fri, 17 Mar 2017 13:01:05 +0800
Message-ID: <20170317050105.GF548@yexl-desktop>
In-Reply-To: <20170316082836.GD30501@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4594349493750580072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/16, Michal Hocko wrote:
>On Thu 16-03-17 10:38:49, kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> commit: bae58218d80c6beffd5c96c0fcae372a0e63ca32 ("mm: move pcp and lru-=
pcp draining into single wq")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
>Could you test with
>http://lkml.kernel.org/r/20170315164021.28532-1-mhocko(a)kernel.org
>applied?

This warning is gone with above patch applied for 10 time boot.

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Thanks,
Xiaolong
>-- =

>Michal Hocko
>SUSE Labs

--===============4594349493750580072==--

