Content-Type: multipart/mixed; boundary="===============0301823587955024339=="
MIME-Version: 1.0
From: Ashwin Chaugule <ashwin.chaugule@linaro.org>
To: lkp@lists.01.org
Subject: Re: [ACPI] 239708a3af: Warning: Processor Platform Limit event detected, but not handled.
Date: Thu, 27 Aug 2015 10:41:33 -0400
Message-ID: <CAJ5Y-eY9gfJWm6xA4Ebai4prMx5ShmB8iqG8hx4BiuB1pZT19A@mail.gmail.com>
In-Reply-To: <87oahtbmam.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0301823587955024339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On 26 August 2015 at 20:35, kernel test robot <ying.huang@intel.com> wrot=
e:
> FYI, we noticed the below changes on
>
> git://internal_merge_and_test_tree devel-catchup-201508251337
> commit 239708a3af44064366f1af0eea02dc1e8991c11b ("ACPI: Split out ACPI PS=
S from ACPI Processor driver")
>
> We found the following new message in kernel log after your commit.
>
> [    8.316777] Warning: Processor Platform Limit event detected, but not =
handled.
> [    8.317857] Consider compiling CPUfreq support into your kernel.

The commit referred to above should maintain previous behavior. i.e.
selecting ACPI_PROCESSOR didn't auto enable CPU_FREQ.

Regards,
Ashwin.

--===============0301823587955024339==--

