Content-Type: multipart/mixed; boundary="===============2394255500386214899=="
MIME-Version: 1.0
From: Jani Nikula <jani.nikula@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/i915: disable CPU PWM also on LPT/SPT backlight disable
Date: Thu, 08 Oct 2015 16:44:07 +0300
Message-ID: <87oag979w8.fsf@intel.com>
In-Reply-To: <87io6tie5w.fsf@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2394255500386214899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Huang, please try this patch.

BR,
Jani.


On Tue, 29 Sep 2015, Jani Nikula <jani.nikula@intel.com> wrote:
> Also adding Cc: intel-gfx, please include that in follow-ups.
>
> Thanks,
> Jani.
>
> On Tue, 29 Sep 2015, Jani Nikula <jani.nikula@intel.com> wrote:
>> Although we don't support or enable CPU PWM with LPT/SPT based systems,
>> it may have been enabled prior to loading the driver. Disable the CPU
>> PWM on LPT/SPT backlight disable to avoid warnings on LCPLL disable.
>>
>> The issue has been present on BDW since BDW enabling, but was recently
>> introduced on HSW with
>>
>> commit 437b15b8017e0d946453c10794b0c5d4591cf180
>> Author: Jani Nikula <jani.nikula@intel.com>
>> Date:   Fri Sep 4 16:55:13 2015 +0300
>>
>>     drm/i915: use pch backlight override on hsw too
>>
>> Reference: http://mid.gmane.org/87y4frhwsn.fsf(a)yhuang-dev.intel.com
>> Reported-by: kernel test robot <ying.huang@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/intel_panel.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_panel.c b/drivers/gpu/drm/i915/i=
ntel_panel.c
>> index dd71e7f139e3..c9c94d05f3dd 100644
>> --- a/drivers/gpu/drm/i915/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/intel_panel.c
>> @@ -731,6 +731,20 @@ static void lpt_disable_backlight(struct intel_conn=
ector *connector)
>>  =

>>  	intel_panel_actually_set_backlight(connector, 0);
>>  =

>> +	/*
>> +	 * Although we don't support or enable CPU PWM with LPT/SPT based
>> +	 * systems, it may have been enabled prior to loading the
>> +	 * driver. Disable to avoid warnings on LCPLL disable.
>> +	 *
>> +	 * This needs rework if we need to add support for CPU PWM on PCH split
>> +	 * platforms.
>> +	 */
>> +	tmp =3D I915_READ(BLC_PWM_CPU_CTL2);
>> +	if (tmp & BLM_PWM_ENABLE) {
>> +		DRM_DEBUG_KMS("cpu backlight was enabled, disabling\n");
>> +		I915_WRITE(BLC_PWM_CPU_CTL2, tmp & ~BLM_PWM_ENABLE);
>> +	}
>> +
>>  	tmp =3D I915_READ(BLC_PWM_PCH_CTL1);
>>  	I915_WRITE(BLC_PWM_PCH_CTL1, tmp & ~BLM_PCH_PWM_ENABLE);
>>  }
>> -- =

>> 2.1.4
>>
>
> -- =

> Jani Nikula, Intel Open Source Technology Center

-- =

Jani Nikula, Intel Open Source Technology Center

--===============2394255500386214899==--

