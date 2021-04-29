Content-Type: multipart/mixed; boundary="===============6491304794432961512=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] 21175ca434: mdadm-selftests.enchmarks/mdadm-selftests/tests/01r1fail.fail
Date: Thu, 29 Apr 2021 15:43:39 +0800
Message-ID: <7f4f7ecd-13e3-b23e-6a0b-04122b98e6f2@intel.com>
In-Reply-To: <YIlrJCdhVaFPdPgb@mit.edu>
List-Id: <oe-lkp.lists.linux.dev>

--===============6491304794432961512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/28/21 10:03 PM, Theodore Ts'o wrote:
> (Hmm, why did you cc linux-km on this report?  I would have thought
> dm-devel would have made more sense?)
>
> On Tue, Apr 27, 2021 at 04:15:39PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 21175ca434c5d49509b73cf473618b01b0b85437 ("ext4: make prefetch_b=
lock_bitmaps default")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> in testcase: mdadm-selftests
>> version: mdadm-selftests-x86_64-5d518de-1_20201008
>> with following parameters:
>>
>> 	disk: 1HDD
>> 	test_prefix: 01r1
>> 	ucode: 0x21
> So this failure makes no sense to me.  Looking at the kmesg failure
> logs, it's failing in the md layer:
>
> kern  :info  : [   99.775514] md/raid1:md0: not clean -- starting backgro=
und reconstruction
> kern  :info  : [   99.783372] md/raid1:md0: active with 3 out of 4 mirrors
> kern  :info  : [   99.789735] md0: detected capacity change from 0 to 378=
88
> kern  :info  : [   99.796216] md: resync of RAID array md0
> kern  :crit  : [   99.900450] md/raid1:md0: Disk failure on loop2, disabl=
ing device.
>                                md/raid1:md0: Operation continuing on 2 de=
vices.
> kern  :crit  : [   99.918281] md/raid1:md0: Disk failure on loop1, disabl=
ing device.
>                                md/raid1:md0: Operation continuing on 1 de=
vices.
> kern  :info  : [  100.835833] md: md0: resync interrupted.
> kern  :info  : [  101.852898] md: resync of RAID array md0
> kern  :info  : [  101.858347] md: md0: resync done.
> user  :notice: [  102.109684] /lkp/benchmarks/mdadm-selftests/tests/01r1f=
ail... FAILED - see /var/tmp/01r1fail.log and /var/tmp/fail01r1fail.log for=
 details
>
> The referenced commit just turns block bitmap prefetching in ext4.
> This should not cause md to failure; if so, that's an md bug, not an
> ext4 bug.  There should not be anything that the file system is doing
> that would cause the kernel to think there is a disk failure.
>
> By the way, the reproduction instructions aren't working currently:
>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install                job.yaml  # job file is attached=
 in this email
> This fails because lkp is trying to apply a patch which does not apply
> with the current version of the md tools.

Hi Ted,

Thanks for the feedback, yes, there's patch already be merged into mdadm,
we have removed it from our code.

>
>>          bin/lkp split-job --compatible job.yaml
>>          bin/lkp run                    compatible-job.yaml
> And the current versions lkp don't generate a compatible-job.yaml file
> when you run "lkp split-job --compatable"; instead it generates a new
> yaml file with a set of random characters to generate a unique name.
> (What Multics parlance would be called a "shriek name"[1] :-)

We have updated the steps to avoid misunderstanding.

>
> Since I was having trouble running the reproduction; could you send
> the /var/tmp/*fail.logs so we could have a bit more insight what is
> going on?

I attached the log file for your reference,
btw the test is from =

https://github.com/neilbrown/mdadm/blob/master/tests/01r1fail,
you may want to run it directly.

Best Regards,
Rong Chen

>
> Thanks!
>
> 					- Ted
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org


--===============6491304794432961512==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="log.ksh"

KyAuIC9sa3AvYmVuY2htYXJrcy9tZGFkbS1zZWxmdGVzdHMvdGVzdHMvMDFyMWZhaWwKKysgbWRh
ZG0gLUNSIC9kZXYvbWQwIC1sMSAtbjQgL2Rldi9sb29wMCAvZGV2L2xvb3AxIC9kZXYvbG9vcDIg
bWlzc2luZworKyBybSAtZiAvdmFyL3RtcC9zdGRlcnIKKysgY2FzZSAkKiBpbgorKyBjYXNlICQq
IGluCisrIGZvciBhcmdzIGluICQqCisrIFtbIC1DUiA9fiAvZGV2LyBdXQorKyBmb3IgYXJncyBp
biAkKgorKyBbWyAvZGV2L21kMCA9fiAvZGV2LyBdXQorKyBbWyAvZGV2L21kMCA9fiBtZCBdXQor
KyBmb3IgYXJncyBpbiAkKgorKyBbWyAtbDEgPX4gL2Rldi8gXV0KKysgZm9yIGFyZ3MgaW4gJCoK
KysgW1sgLW40ID1+IC9kZXYvIF1dCisrIGZvciBhcmdzIGluICQqCisrIFtbIC9kZXYvbG9vcDAg
PX4gL2Rldi8gXV0KKysgW1sgL2Rldi9sb29wMCA9fiBtZCBdXQorKyAvbGtwL2JlbmNobWFya3Mv
bWRhZG0tc2VsZnRlc3RzL21kYWRtIC0temVybyAvZGV2L2xvb3AwCm1kYWRtOiBVbnJlY29nbmlz
ZWQgbWQgY29tcG9uZW50IGRldmljZSAtIC9kZXYvbG9vcDAKKysgZm9yIGFyZ3MgaW4gJCoKKysg
W1sgL2Rldi9sb29wMSA9fiAvZGV2LyBdXQorKyBbWyAvZGV2L2xvb3AxID1+IG1kIF1dCisrIC9s
a3AvYmVuY2htYXJrcy9tZGFkbS1zZWxmdGVzdHMvbWRhZG0gLS16ZXJvIC9kZXYvbG9vcDEKbWRh
ZG06IFVucmVjb2duaXNlZCBtZCBjb21wb25lbnQgZGV2aWNlIC0gL2Rldi9sb29wMQorKyBmb3Ig
YXJncyBpbiAkKgorKyBbWyAvZGV2L2xvb3AyID1+IC9kZXYvIF1dCisrIFtbIC9kZXYvbG9vcDIg
PX4gbWQgXV0KKysgL2xrcC9iZW5jaG1hcmtzL21kYWRtLXNlbGZ0ZXN0cy9tZGFkbSAtLXplcm8g
L2Rldi9sb29wMgptZGFkbTogVW5yZWNvZ25pc2VkIG1kIGNvbXBvbmVudCBkZXZpY2UgLSAvZGV2
L2xvb3AyCisrIGZvciBhcmdzIGluICQqCisrIFtbIG1pc3NpbmcgPX4gL2Rldi8gXV0KKysgL2xr
cC9iZW5jaG1hcmtzL21kYWRtLXNlbGZ0ZXN0cy9tZGFkbSAtLXF1aWV0IC1DUiAvZGV2L21kMCAt
bDEgLW40IC9kZXYvbG9vcDAgL2Rldi9sb29wMSAvZGV2L2xvb3AyIG1pc3NpbmcgLS1hdXRvPXll
cworKyBydj0wCisrIGNhc2UgJCogaW4KKysgY2F0IC92YXIvdG1wL3N0ZGVycgorKyByZXR1cm4g
MAorKyBjaGVjayByZXN5bmMKKysgY2FzZSAkMSBpbgorKyBjbnQ9NQorKyBncmVwIC1zcSByZXN5
bmMgL3Byb2MvbWRzdGF0CisrIG1kYWRtIC9kZXYvbWQwIC0tZmFpbCAvZGV2L2xvb3AyCisrIHJt
IC1mIC92YXIvdG1wL3N0ZGVycgorKyBjYXNlICQqIGluCisrIGNhc2UgJCogaW4KKysgL2xrcC9i
ZW5jaG1hcmtzL21kYWRtLXNlbGZ0ZXN0cy9tZGFkbSAtLXF1aWV0IC9kZXYvbWQwIC0tZmFpbCAv
ZGV2L2xvb3AyCisrIHJ2PTAKKysgY2FzZSAkKiBpbgorKyBjYXQgL3Zhci90bXAvc3RkZXJyCisr
IHJldHVybiAwCisrIGNoZWNrIHJlc3luYworKyBjYXNlICQxIGluCisrIGNudD01CisrIGdyZXAg
LXNxIHJlc3luYyAvcHJvYy9tZHN0YXQKKysgbWRhZG0gL2Rldi9tZDAgLS1mYWlsIC9kZXYvbG9v
cDEKKysgcm0gLWYgL3Zhci90bXAvc3RkZXJyCisrIGNhc2UgJCogaW4KKysgY2FzZSAkKiBpbgor
KyAvbGtwL2JlbmNobWFya3MvbWRhZG0tc2VsZnRlc3RzL21kYWRtIC0tcXVpZXQgL2Rldi9tZDAg
LS1mYWlsIC9kZXYvbG9vcDEKKysgcnY9MAorKyBjYXNlICQqIGluCisrIGNhdCAvdmFyL3RtcC9z
dGRlcnIKKysgcmV0dXJuIDAKKysgc2xlZXAgMQorKyBjaGVjayBub3N5bmMKKysgY2FzZSAkMSBp
bgorKyBzbGVlcCAwLjUKKysgZ3JlcCAtc3EgLUUgJyhyZXN5bmN8cmVjb3Zlcnl8cmVzaGFwZSkg
Kj0nIC9wcm9jL21kc3RhdAorKysgc2VkICcvXiAqXChbMC05XSpcKSBcLyBcMS9kJworKysgZ3Jl
cCAvIC9zeXMvYmxvY2svbWQwL21kL3N5bmNfY29tcGxldGVkCisrIGluY29tcGxldGU9JzI0MzIg
LyAzNzg4OCcKKysgJ1snIC1uICcyNDMyIC8gMzc4ODgnICddJworKyBkaWUgJ3Jlc3luYyBvciBy
ZWNvdmVyeSBpcyBoYXBwZW5pbmchJworKyBlY2hvIC1lICdcblx0RVJST1I6IHJlc3luYyBvciBy
ZWNvdmVyeSBpcyBoYXBwZW5pbmchIFxuJwoKCUVSUk9SOiByZXN5bmMgb3IgcmVjb3ZlcnkgaXMg
aGFwcGVuaW5nISAKCisrIHNhdmVfbG9nIGZhaWwKKysgc3RhdHVzPWZhaWwKKysgbG9nZmlsZT1m
YWlsMDFyMWZhaWwubG9nCisrIGNhdCAvdmFyL3RtcC9zdGRlcnIKKysgY3AgL3Zhci90bXAvbG9n
IC92YXIvdG1wLzAxcjFmYWlsLmxvZworKyBlY2hvICcjIyBsa3AtaXZiLWQwNDogc2F2aW5nIGRt
ZXNnLicKKysgZG1lc2cgLWMKKysgZWNobyAnIyMgbGtwLWl2Yi1kMDQ6IHNhdmluZyBwcm9jIG1k
c3RhdC4nCisrIGNhdCAvcHJvYy9tZHN0YXQKKysgYXJyYXk9KCQobWRhZG0gLURzIHwgY3V0IC1k
JyAnIC1mMikpCisrKyBtZGFkbSAtRHMKKysrIHJtIC1mIC92YXIvdG1wL3N0ZGVycgorKysgY3V0
ICctZCAnIC1mMgorKysgY2FzZSAkKiBpbgorKysgY2FzZSAkKiBpbgorKysgL2xrcC9iZW5jaG1h
cmtzL21kYWRtLXNlbGZ0ZXN0cy9tZGFkbSAtLXF1aWV0IC1EcworKysgcnY9MAorKysgY2FzZSAk
KiBpbgorKysgY2F0IC92YXIvdG1wL3N0ZGVycgorKysgcmV0dXJuIDAKKysgJ1snIGZhaWwgPT0g
ZmFpbCAnXScKKysgZWNobyAnRkFJTEVEIC0gc2VlIC92YXIvdG1wLzAxcjFmYWlsLmxvZyBhbmQg
L3Zhci90bXAvZmFpbDAxcjFmYWlsLmxvZyBmb3IgZGV0YWlscycKRkFJTEVEIC0gc2VlIC92YXIv
dG1wLzAxcjFmYWlsLmxvZyBhbmQgL3Zhci90bXAvZmFpbDAxcjFmYWlsLmxvZyBmb3IgZGV0YWls
cworKyAnWycgbG9vcCA9PSBsdm0gJ10nCisrICdbJyBsb29wID09IGxvb3AgLW8gbG9vcCA9PSBk
aXNrICddJworKyAnWycgJyEnIC16IC9kZXYvbWQwIC1hIDEgLWdlIDEgJ10nCisrIGVjaG8gJyMj
IGxrcC1pdmItZDA0OiBtZGFkbSAtRCAvZGV2L21kMCcKKysgL2xrcC9iZW5jaG1hcmtzL21kYWRt
LXNlbGZ0ZXN0cy9tZGFkbSAtRCAvZGV2L21kMAorKyBjYXQgL3Byb2MvbWRzdGF0CisrIGdyZXAg
LXEgJ2xpbmVhclx8ZXh0ZXJuYWwnCisrIG1kX2Rpc2tzPSgkKCRtZGFkbSAtRCAtWSAke2FycmF5
W0BdfSB8IGdyZXAgIi9kZXYvIiB8IGN1dCAtZCc9JyAtZjIpKQorKysgL2xrcC9iZW5jaG1hcmtz
L21kYWRtLXNlbGZ0ZXN0cy9tZGFkbSAtRCAtWSAvZGV2L21kMAorKysgZ3JlcCAvZGV2LworKysg
Y3V0IC1kPSAtZjIKKysgY2F0IC9wcm9jL21kc3RhdAorKyBncmVwIC1xIGJpdG1hcAorKyAnWycg
MSAtZXEgMCAnXScKKysgZXhpdCAyCg==

--===============6491304794432961512==--

