Content-Type: multipart/mixed; boundary="===============8203229760680397615=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/lru] ba8a9d1f17: fio.read_iops -30.1% regression
Date: Wed, 05 Aug 2020 16:55:03 +0800
Message-ID: <66c2a133-e4b6-bab7-4708-e04900366976@intel.com>
In-Reply-To: <37652ace-7122-3a0c-a720-a57fe4dcde08@linux.alibaba.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8203229760680397615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/5/20 4:20 PM, Alex Shi wrote:
> Hi Rong,
>
> I am also trying linux-next with vm-scalibilty case-lru-file-mmap-read
> find the result is quit vary, like
> linux-next-0803 	no memcg  77434 KB/s, memcg 72525 KB/s
> linux-next, 860e73b49cd9		memcg 42487 KB/s
>
> Is this case too sensitive or other reasons?
Hi Alex,

I have checked the test for v5.8-rc7, the results are stable in our =

environment.

>
> Thanks
> Alex
>
> =E5=9C=A8 2020/8/5 =E4=B8=8B=E5=8D=883:31, Alex Shi =E5=86=99=E9=81=93:
>> Hi Rong,
>>
>> Thanks a lot for the report!
>>
>> Could I assume the base commit are both 5.8-rc6? since the this commit
>> and another regression on commit ea4ebd4126 are just minium change which=
 share
>> the same base 5.8-rc6.
>> [mm/lru] ea4ebd4126: fio.read_iops -10.0% regression
>>
>> So, if we share the same base, and testing on same machine, with same ke=
rnel config,
>>
>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wit=
h 256G memory
>>
>> Why the base base throughput is quit so different, from 2.8e+06 VS 4.3e+=
06?
Because the test parameters are different, the old commit ea4ebd4126 =

also has 28% regression on this case.

Best Regards,
Rong Chen

>>
>> Thanks
>> Alex
>>
>> =E5=9C=A8 2020/8/4 =E4=B8=8B=E5=8D=884:48, kernel test robot =E5=86=99=
=E9=81=93:
>>>                                                                        =
           =

>>>                                       fio.read_iops
>>>                                                                        =
          =

>>>    2.8e+06 +-----------------------------------------------------------=
------+
>>>    2.7e+06 |-++.    .+..+.       .+.  .+             .+..+             =
      |
>>>            |..  +..+      +..+.+.   +.  +  .+..+.+..+     :       .+   =
      |
>>>    2.6e+06 |-+                           +.               :    .+.     =
      |
>>>    2.5e+06 |-+                                             +..+        =
      |
>>>    2.4e+06 |-+                                                         =
      |
>>>    2.3e+06 |-+                                                         =
      |
>>>            |                                                           =
      |
>>>    2.2e+06 |-+                                                         =
      |
>>>    2.1e+06 |-+                                                         =
      |
>>>      2e+06 |-+                                                         =
      |
>>>    1.9e+06 |-+                                                         =
      |
>>>            |         O       O         O         O         O           =
      |
>>>    1.8e+06 |-+O O  O    O O    O    O    O  O  O    O O  O    O      O =
 O O  |
>>>    1.7e+06 +-----------------------------------------------------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
            =

>> looks like the result is quit vary on the same machine, and almost same =
base.
>>
>>                                     fio.read_iops
>>                                                                         =
         =

>>    4.3e+06 +------------------------------------------------------------=
-----+
>>            |.+.+. .+. .+.  .+          .+.+. .+. .+.+. .+.+..         .+=
.    |
>>    4.2e+06 |-+   +   +   +.  +     .+.+     +   +     +      +.+.+. .+  =
 +. .|
>>    4.1e+06 |-+                +.+.+                                +    =
   + |
>>            |                                                            =
     |
>>      4e+06 |-+                                                          =
     |
>>    3.9e+06 |-+                                                          =
     |
>>            |   O              O                                         =
     |
>>    3.8e+06 |-+     O O O O        O             O O                     =
     |
>>    3.7e+06 |-O   O          O         O O O O O     O                   =
     |
>>            |                        O                                   =
     |
>>    3.6e+06 |-+                                                          =
     |
>>    3.5e+06 |-+                                                          =
     |
>>            |                    O                                       =
     |
>>    3.4e+06 +------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>

--===============8203229760680397615==--

