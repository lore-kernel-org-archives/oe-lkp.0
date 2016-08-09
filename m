Content-Type: multipart/mixed; boundary="===============2431562277015323681=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] 20067c4c13: kernel BUG at arch/x86/mm/physaddr.c:26!
Date: Wed, 10 Aug 2016 04:03:24 +0800
Message-ID: <20160809200324.GA5204@wfg-t540p.sh.intel.com>
In-Reply-To: <CAJcbSZFHj9tcJXCy3KLpeaET2An0bAkpZaQutnNchDd0M8ChMw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2431562277015323681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

>> This script may reproduce the error.
>>
>> ------------------------------------------------------------------------=
----
>> #!/bin/bash
>>
>> kernel=3D$1
>>
>> kvm=3D(
>>         qemu-system-x86_64
>>         -enable-kvm
>>         -cpu kvm64
>>         -kernel $kernel
>>         -m 369
>>         -smp 2

[snip]

>> "${kvm[@]}" --append "${append[*]}"
>> ------------------------------------------------------------------------=
----
>>
>
>Thanks a lot, that was super useful. I made a fix and tested it did. I
>kept the script and config for future use.

Glad that you like it! Note that it's an auto generated script, which
may look and behave different in the next bug report. :)

Thanks,
Fengguang

--===============2431562277015323681==--

