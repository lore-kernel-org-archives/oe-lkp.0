Content-Type: multipart/mixed; boundary="===============6927980461901032501=="
MIME-Version: 1.0
From: Wolfram Sang <wsa@the-dreams.de>
To: lkp@lists.01.org
Subject: Re: [i2c] 95026658c4: WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.c:1930 i2c_register_driver+0x2c/0x79()
Date: Mon, 14 Mar 2016 02:14:19 +0100
Message-ID: <20160314011419.GA2308@katana>
In-Reply-To: <874mc9holc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6927980461901032501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 08:47:59AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux i2c/for-next
> commit 95026658c46ea2d94498d0dac1282e28cd47c64a ("i2c: do not use interna=
l data from driver core")

Ouch! So nobody of us ever boot-tested this patch? :( Will send a fix
soon.


--===============6927980461901032501==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlc1aEJxQUFvSkVCUU41TXdVb0NtMkNxVVAvMEFaVTFPb2oyaUd1UFozMHJjZWhEY0UK
b1F0aU01R2Z1VmFhakpNb2p1c1grYy9BeFV0WUFRbXlZeXFjWW1wVlNvNmo4RlRnT0xQaVpTcTE5
c0tGanVqVwp5Z1FJUjFVdlJPVlVZRXFxODZJeHJ5SjZsRW1aOHRtNVM5VURIb3NuNmFMdGl2eXBT
OGVpazQ5WkhkdVVXZUxRCkR5Zmw4dVk3U3R6dmRpelhIUFVFeTcrWVZKS1pkelk1a1M4VTlxc0x4
WlYraHo3YUJORFVvZnJVc3ZzcU9TaFQKVStSeHdtdkxzbXgvczBhd1MrQmE2UXRWUm9UQnhIMWFV
UlgwQ3lrcHZEbWI3bnZSRE10REFUdE5UMEFtTXdUMQpRUU5KTnF0bnpTSlVYaWNKSFZWQ3M5Tm0v
czNVb1hTMWpsLzRFT0x3VUczUkNMUXBCcWtzekFtQk1qNTZWU2s1CkU0ZlcxT21jZGEyeFFYR2tZ
aDU2bjZBK1VzaC82ZjhWaHA3NDZpZFBRUWprNTkwdnpoWEZaNkhxRUlPTW5yd1gKRWpRT2JJcVl3
d2lpSFhFWmxmZHpWb21uWFFIYTVlTDUwd09mMnl1VmNvbXRZOG5MSG5aZ3dDK085eHFNOERjKwpU
ZmtiSUlNQm1IODRnRktsNnd4M0xqWmEveEw4UEhoeVB4czMyV1hjY05tcjhBRHpDUVk0YllXZFZh
RERGbFNtCityTGx6V1pINHZ1MXFrbC9LWkl0Z1MrTkFTeXBRaHlTN1IvQmh1UUZYQXI5RTZ0YTRG
VE5aWUEzSVFwREkrYXoKTWtIV3VleTJDQTVIQno2L2ZUOGV0NHU0dDNUQ2o0M1FBY1Bvdm43SVBv
ZkVCd2lSTnVNZkJGandGUEdOTmhFUwpHYzVycXNFTVpFR3Vqa1ZUMGozago9TmVyZgotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============6927980461901032501==--

