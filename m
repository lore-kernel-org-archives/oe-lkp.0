Content-Type: multipart/mixed; boundary="===============4212103195075967345=="
MIME-Version: 1.0
From: Shuah Khan <shuahkh@osg.samsung.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Thu, 02 Nov 2017 08:50:15 -0600
Message-ID: <a3737a76-10e7-5791-7eda-c62bf43b3504@osg.samsung.com>
In-Reply-To: <20171102085357.GA14531@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4212103195075967345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/02/2017 02:53 AM, Greg Kroah-Hartman wrote:
> On Wed, Nov 01, 2017 at 04:38:02PM -0600, Shuah Khan wrote:
>>> For me also, if I have to test my code outside kernel tree, I usually
>>> copy ion.h header file locally and test it.
>>>
>>> But, still I have one question about staging tree kernel headers.
>>> How the kernel headers are created in case of Android where it uses
>>> the ion and other headers heavily?
>>>
>>
>> So this is a question for Greg KH? How do we handle staging headers?
> =

> We don't :)
> =

> Don't work too hard, or at all, for staging headers, someone should be
> working to get the code out of staging.  No need to provide "full
> functionality" for all of the different kselftest options for staging
> code, as that's just going to be a pain.
> =

>> We have couple of options here:
>>
>> - add a staging header install as part of kselftest
> =

> No

Great.

> =

>> - add a kselftest source tar-ball utility that covers the staging header
>>   dependencies.
> =

> No.
> =

> Just don't install them, as they are not part of the normal process,
> don't do anything special here please.

Great.

> =

>> I am reluctant to add a local ion.h. I would rather solve the bigger iss=
ue.
>> I think this might not be the only time we will run into this type of de=
pendency
> =

> For any other kernel code, stuff should go into uapi headers, but
> staging is "special" here, so don't worry about it.  Use relative paths
> and all should be fine for the limited amount of testing possible.
> =

> I really do not like to see any staging dependancies out of
> drivers/staging/ at all, as staging code should be self-contained and
> could be deleted tomorrow with no other side effects at all.  So maybe
> there should not be any kselftests allowed for staging code...
> =


Thanks for engaging in this discussion. My intent was to explore all the
options and rule them out for staging headers and kselftest. This is the
first test that tests a staging driver and has dependency on staging
headers.

Here is what I would propose. I am going to take this test as an individual
test:

- without adding it to the kselftest run.
- with a local ion.h

This way it is available for people that want to run it. When ion driver
moves out of staging it can be added to kselftest run with proper uapi
header.

Pintu! I will review v5 and send you comments. I think you will need to
make one change to not add ion test to selftests/Makefile.

thanks,
-- Shuah




--===============4212103195075967345==--

