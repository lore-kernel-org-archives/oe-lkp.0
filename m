Content-Type: multipart/mixed; boundary="===============2637662376098445563=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] 48ed83b84da: scaling_governor write error
Date: Fri, 17 Oct 2014 10:25:47 +0800
Message-ID: <20141017022547.GA8005@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2637662376098445563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

FYI, our test script is broken by a commit from you:

https://git.linaro.org/people/vireshk/linux cpufreq/governor-fixes
commit 48ed83b84da331d010c5bd10b9d2f72d5308bddd ("cpufreq: Track governor-s=
tate to disallow invalid state requests")


ee46f1592843a04d  48ed83b84da331d010c5bd10b9 =

----------------  -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |
           :5          100%           5:5     TOTAL stderr./lkp/lkp/src/set=
up/cpufreq_governor:line#:echo:write_error:Invalid_argument

The error messages are:

 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or =
resource busy
 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or =
resource busy
 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or =
resource busy

where the cpufreq_governor script is
 =

        #!/bin/bash

        scaling_governor=3D$1
        [[ $scaling_governor ]] || exit 0

        for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
        do
                note "echo $scaling_governor > $file"
=3D=3D>             echo $scaling_governor > $file
        done

Thanks,
Fengguang

--===============2637662376098445563==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCg==

--===============2637662376098445563==--

