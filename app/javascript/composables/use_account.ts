import Axios, { AxiosError } from 'axios'
import { Ref, ref, reactive} from 'vue'
import { useCookies } from '@vueuse/integrations/useCookies'

import type { User } from '../interfaces/user'

import { useViewData } from './use_view_data'
import { useFlash } from './use_flash'

interface GetAccountApiResponse {
  data: AccountAttributes
}

interface AccountAttributes {
  attributes: AccountJson
}

interface AccountJson {
  id: number
  token: string
}

export function useAccount() {
  const logged_in: Ref<boolean> = ref<boolean>(false)
  const current_user = reactive<User>({
    id: null,
    token: null
  })

  const { constants } = useViewData()
  const cookies = useCookies(['access_token'])
  const { flash, clearFlash } = useFlash()

  const getAccount = async () => {
    clearFlash()

    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const res = await Axios.get<GetAccountApiResponse>(`${constants.api_origin}/account`,
        {
          headers: {
            Authorization: `Bearer ${cookies.get('access_token')}`
          }
        })

      //if (json) {
      const {data: accountJson } = res.data

      current_user.id = accountJson.attributes.id
      current_user.token = accountJson.attributes.token
      //}
    } catch (error) {
      if(Axios.isAxiosError(error)){
        setErrorMessage(error as AxiosError)
      }
    }
  }

  const setErrorMessage = (error: AxiosError) => {
    const status = error.response?.status
    switch(status){
    case 401:
      break
    case 500:
      flash.value.alert = '不具合が発生しました'
      break
    default:
      flash.value.alert = '不具合が発生しました'
    }
  }

  return {
    logged_in,
    current_user,
    getAccount
  }
}