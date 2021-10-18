Content-Type: multipart/mixed; boundary="===============7737456187550875113=="
MIME-Version: 1.0
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: lkp@lists.01.org
Subject: Re: [selftests/tls] e506342a03: kernel-selftests.net.tls.fail
Date: Mon, 18 Oct 2021 14:44:15 +0800
Message-ID: <c8907aec-de04-fbc0-e186-a4997fea77c9@linux.alibaba.com>
In-Reply-To: <YWzhDhWPD5/Bf2Lp@rli9-dbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============7737456187550875113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

On 10/18/21 10:50 AM, Philip Li wrote:
> On Mon, Oct 18, 2021 at 10:40:13AM +0800, Tianjia Zhang wrote:
>> Hi,
>>
>> This test needs to enable the SM4 algorithm, and the config file you
>> provided does not enable this algorithm.
> thanks for the info, we will recheck this. And how about adding
> this kconfig requirement to tools/testing/selftests/net/config file?
> =


I fixed this problem and sent you an email, thanks for your test.

Best regards,
Tianjia
--===============7737456187550875113==--

