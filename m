Content-Type: multipart/mixed; boundary="===============2834181610487914526=="
MIME-Version: 1.0
From: Andrii Nakryiko <andriin@fb.com>
To: lkp@lists.01.org
Subject: Re: [selftests/bpf] da43712a72: kernel-selftests.bpf.make_fail
Date: Thu, 14 May 2020 11:38:27 -0700
Message-ID: <e5221ecb-04ad-bc77-d66f-b438c1a8b5c7@fb.com>
In-Reply-To: <20200514103017.GA1829391@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2834181610487914526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/14/20 3:30 AM, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2020 at 11:14:20AM +0800, Hangbin Liu wrote:
>> On Wed, May 13, 2020 at 12:26:34PM +0200, Greg Kroah-Hartman wrote:
>>> On Wed, May 13, 2020 at 05:58:35PM +0800, Hangbin Liu wrote:
>>>>
>>>> Thanks test bot catch the issue.
>>>> On Wed, May 13, 2020 at 03:44:18PM +0800, kernel test robot wrote:
>>>>> Greeting,
>>>>>
>>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>>
>>>>> commit: 77bb53cb094828a31cd3c5b402899810f63073c1 ("selftests/bpf: Fix=
 perf_buffer test on systems w/ offline CPUs")
>>>>> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.g=
it linux-5.4.y
>>>>
>>>> The author for this commit is Andrii(cc'd).
>>>>
>>>> Mine is f1c3656c6d9c ("selftests/bpf: Skip perf hw events test if the =
setup disabled it")
>>>>> prog_tests/stacktrace_build_id_nmi.c:55:3: error: label =E2=80=98clea=
nup=E2=80=99 used but not defined
>>>>>     goto cleanup;
>>>>>     ^~~~
>>>>
>>>> Hi Greg, we are missing a depend commit
>>>> dde53c1b763b ("selftests/bpf: Convert few more selftest to skeletons").
>>>>
>>>> So either we need backport this patch, or if you like, we can also fix=
 it by
>>>> changing 'goto cleanup;' to 'goto close_prog;'. So which one do you pr=
efer?

Hi, sorry for late reply, missed emails earlier.

The above "selftest to skeletons" commit will need some more after that, =

it's going to be a pretty big back-port, so I think just fixing it up =

would be ok.

>>>
>>> I don't know, I have no context here at all, sorry.
>>>
>>> What stable kernel tree is failing, what patch needs to be changed, what
>>> patch caused this, and so on...
>>>
>>> confused,
>>
>> Oh, sorry, I should reply the full email. I will forward the full messag=
e in
>> the bellow. For your questions:
>>
>> the stable kernel tree is linux-5.4.y,
>> my patch is da43712a7262 ("selftests/bpf: Skip perf hw events test if the
>> setup disabled it")[1].
>>
>> The reason is we are lacking upstream commit
>> dde53c1b763b ("selftests/bpf: Convert few more selftest to skeletons").
>>
>> This will call build warning
>> prog_tests/stacktrace_build_id_nmi.c:55:3: error: label =E2=80=98cleanup=
=E2=80=99 used but not defined
>>     goto cleanup;
>>     ^~~~
>>
>> To fix it, I think the easiest way is change the "goto cleanup" to "goto
>> close_prog".
> =

> Ok, can you send a patch for this, documenting all of the above so I
> know what's going on?
> =

>> For the other error:
>>
>> prog_tests/perf_buffer.c: In function =E2=80=98test_perf_buffer=E2=80=99:
>> prog_tests/perf_buffer.c:39:8: warning: implicit declaration of function=
 =E2=80=98parse_cpu_mask_file=E2=80=99 [-Wimplicit-function-declaration]
>>    err =3D parse_cpu_mask_file("/sys/devices/system/cpu/online",
>>          ^~~~~~~~~~~~~~~~~~~
>> ../lib.mk:138: recipe for target '/usr/src/perf_selftests-x86_64-rhel-7.=
6-kselftests-da43712a7262891317883d4b3a909fb18dac4b1d/tools/testing/selftes=
ts/bpf/test_progs' failed
>> make: *** [/usr/src/perf_selftests-x86_64-rhel-7.6-kselftests-da43712a72=
62891317883d4b3a909fb18dac4b1d/tools/testing/selftests/bpf/test_progs] Erro=
r 1
>> make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-7.6-kselfte=
sts-da43712a7262891317883d4b3a909fb18dac4b1d/tools/testing/selftests/bpf'
>>
>> I think Andrii may like help.
> =

> That looks like a bug, we should revert the offending patch, right?

6803ee25f0ea ("libbpf: Extract and generalize CPU mask parsing logic") =

added parse_cpu_mask_file() function, so back-porting that commit should =

solve this? It should be straightforward and shouldn't bring any more =

dependent commits.

> =

> thanks,
> =

> greg k-h
>=20

--===============2834181610487914526==--

